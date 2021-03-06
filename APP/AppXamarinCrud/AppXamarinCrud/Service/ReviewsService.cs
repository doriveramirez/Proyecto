﻿using AppXamarinCrud.Model;
using MVVM.Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using VideogameDatabase.Service;

namespace MVVM.Service
{
    public class ReviewsService
    {
        public ObservableCollection<Review> Reviews { get; set; }
        public ObservableCollection<User> Users { get; set; }
        public ObservableCollection<Videogame> Videogames { get; set; }


        private string apiUrl, apiUrl3, apiUrl4;

        public ReviewsService()
        {
            using (var data = new DataAccess())
            {
                apiUrl = data.GetConnection().Url + "/api/Reviews";
                apiUrl3 = data.GetConnection().Url + "/api/Users";
                apiUrl4 = data.GetConnection().Url + "/api/Videogames";
            }
            if (Reviews == null)
            {
                Reviews = new ObservableCollection<Review>();
            }
            if (Users == null)
            {
                Users = new ObservableCollection<User>();
            }
            if (Videogames == null)
            {
                Videogames = new ObservableCollection<Videogame>();
            }
        }

        public async System.Threading.Tasks.Task<ObservableCollection<Review>> Consult()
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
                        Reviews = JsonConvert.DeserializeObject<ObservableCollection<Review>>(result);
                    }
                }
                return Reviews;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public ObservableCollection<Review> ConsultLocal()
        {
            using (var data = new DataAccess())
            {
                var list = data.GetReviews();
                foreach (var item in list)
                    Reviews.Add(item);
            }
            return Reviews;
        }

        public async System.Threading.Tasks.Task<ObservableCollection<User>> ConsultUser()
        {
            try
            {
                HttpClient client;
                using (client = new HttpClient())
                {
                    client = CreateClient();
                    HttpResponseMessage response = await client.GetAsync(apiUrl3);
                    if (response.IsSuccessStatusCode)
                    {
                        var result = await response.Content.ReadAsStringAsync();
                        Users = JsonConvert.DeserializeObject<ObservableCollection<User>>(result);
                    }
                }
                return Users;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public ObservableCollection<User> ConsultUserLocal()
        {
            using (var data = new DataAccess())
            {
                var list = data.GetUsers();
                foreach (var item in list)
                    Users.Add(item);
            }
            return Users;
        }

        public async System.Threading.Tasks.Task<ObservableCollection<Videogame>> ConsultVideogame()
        {
            try
            {
                HttpClient client;
                using (client = new HttpClient())
                {
                    client = CreateClient();
                    HttpResponseMessage response = await client.GetAsync(apiUrl4);
                    if (response.IsSuccessStatusCode)
                    {
                        var result = await response.Content.ReadAsStringAsync();
                        Videogames = JsonConvert.DeserializeObject<ObservableCollection<Videogame>>(result);
                    }
                }
                return Videogames;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public ObservableCollection<Videogame> ConsultVideogameLocal()
        {
            using (var data = new DataAccess())
            {
                var list = data.GetVideogames();
                foreach (var item in list)
                    Videogames.Add(item);
            }
            return Videogames;
        }

        public async void Save(Review modelo)
        {
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
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void SaveLocal(Review model)
        {
            using (var data = new DataAccess())
            {
                data.InsertReview(model);
            }
        }

        public async void Modify(Review modelo)
        {
            try
            {
                HttpClient client;
                using (client = new HttpClient())
                {
                    client = CreateClient();
                    var json = JsonConvert.SerializeObject(modelo);
                    var content = new StringContent(json, Encoding.UTF8, "application/json");
                    Uri apiUrl2 = new Uri(string.Format("http://192.168.103.68:40089/api/Reviews/{0}", modelo.Id));
                    HttpResponseMessage response = await client.PutAsync(apiUrl2, content);
                    Console.WriteLine(response.IsSuccessStatusCode);
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void ModifyLocal(Review model)
        {
            using (var data = new DataAccess())
            {
                data.ModifyReview(model);
            }
        }

        public async void Delete(string idReview)
        {
            try
            {
                HttpClient client;
                using (client = new HttpClient())
                {
                    client = CreateClient();
                    HttpResponseMessage response = await client.DeleteAsync(apiUrl + "/" + idReview);
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void DeleteLocal(Review model)
        {
            using (var data = new DataAccess())
            {
                data.DeleteReview(model);
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

