﻿using MVVM.Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;

namespace MVVM.Service
{
    public class DistribuidoraService
    {
        public ObservableCollection<Distribuidora> Distribuidoras { get; set; }
        private const string apiUrl = "http://192.168.1.180:40089/api/Distribuidoras";

        public DistribuidoraService()
        {
            if (Distribuidoras == null)
            {
                Distribuidoras = new ObservableCollection<Distribuidora>();
            }
        }

        public async System.Threading.Tasks.Task<ObservableCollection<Distribuidora>> Consultar()
        {
            try
            {
                HttpClient client;
                using (client = new HttpClient())
                {
                    client = CreateClient();
                    HttpResponseMessage response = await client.GetAsync(apiUrl);
                    if (response.IsSuccessStatusCode)
                    {
                        var result = await response.Content.ReadAsStringAsync();
                        Distribuidoras = JsonConvert.DeserializeObject<ObservableCollection<Distribuidora>>(result);
                    }
                }
                return Distribuidoras;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public async System.Threading.Tasks.Task<bool> Guardar(Distribuidora modelo)
        {
            bool sent = false;
            try
            {
                HttpClient client;
                using (client = new HttpClient())
                {
                    client = CreateClient();
                    var send = Newtonsoft.Json.JsonConvert.SerializeObject(modelo,
                            Newtonsoft.Json.Formatting.None,
                            new JsonSerializerSettings
                            {
                                NullValueHandling = NullValueHandling.Ignore
                            });
                    HttpRequestMessage request = new HttpRequestMessage(HttpMethod.Post, "");
                    request.Content = new StringContent(send, Encoding.UTF8, "application/json");//CONTENT-TYPE header
                    HttpResponseMessage response = await client.SendAsync(request);
                    if (response.IsSuccessStatusCode)
                    {
                        sent = true;
                    }
                }
                return sent;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public async System.Threading.Tasks.Task<bool> Modificar(Distribuidora modelo)
        {
            bool sent = false;
            try
            {
                HttpClient client;
                using (client = new HttpClient())
                {
                    client = CreateClient();
                    var json = JsonConvert.SerializeObject(modelo);
                    var content = new StringContent(json, Encoding.UTF8, "application/json");
                    Uri apiUrl2 = new Uri(string.Format("http://192.168.103.68:40089/api/Distribuidoras/{0}", modelo.Id));
                    Console.WriteLine("ip " + apiUrl2 + " modelo " + modelo.Id + " nombre " + modelo.Nombre + " num " + modelo.NumeroJuegosPublicados + " imag" + modelo.Imagen);
                    HttpResponseMessage response = await client.PutAsync(apiUrl2, content);
                    Console.WriteLine(response.IsSuccessStatusCode);
                    if (response.IsSuccessStatusCode)
                    {
                        sent = true;
                    }
                }
                return sent;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public async System.Threading.Tasks.Task<bool> Eliminar(string idDistribuidora)
        {
            bool sent = false;
            try
            {
                HttpClient client;
                using (client = new HttpClient())
                {
                    client = CreateClient();
                    HttpResponseMessage response = await client.DeleteAsync(apiUrl + "/" + idDistribuidora);
                    if (response.IsSuccessStatusCode)
                    {
                        sent = true;
                    }
                }
                return sent;
            }
            catch (Exception)
            {
                throw;
            }
        }

        private HttpClient CreateClient()
        {
            HttpClient client = new HttpClient();
            client.BaseAddress = new Uri(apiUrl);
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            //client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", ConfigurationManager.AppSettings["token"].ToString());
            client.Timeout = TimeSpan.FromMinutes(10);
            client.Timeout = new TimeSpan(0, 0, 0, 0, -1);
            return client;
        }

    }
}
