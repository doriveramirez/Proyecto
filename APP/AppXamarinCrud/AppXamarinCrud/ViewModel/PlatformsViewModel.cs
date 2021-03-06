﻿using AppXamarinCrud.Model;
using AppXamarinCrud.View;
using MVVM.Model;
using MVVM.Service;
using MVVM.View;
using Newtonsoft.Json;
//using OfficeOpenXml.FormulaParsing.Excel.Functions.Text;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Forms;

namespace MVVM.ViewModel
{
    public class PlatformsViewModel : Platform
    {
        private Task<ObservableCollection<Platform>> PlatformsTask { get; set; }
        private ObservableCollection<Platform> PlatformsAux { get; set; }
        public ObservableCollection<Platform> Platforms { get; set; }

        Platform model;

        PlatformsService service = new PlatformsService();

        public PlatformsViewModel()
        {
            ReleaseDate = DateTime.Now;
            ListView();
            ListViewAsync();
            SaveCommand = new Command(async () => await Save(), () => !IsBusy);
            ModifyCommand = new Command(async () => await Modify(), () => !IsBusy);
            DeleteCommand = new Command(async () => await Delete(), () => !IsBusy);
            CleanCommand = new Command(Clean, () => !IsBusy);
            GoCommand = new Command(Go, () => !IsBusy);
            BackCommand = new Command(Back, () => !IsBusy);
        }

        private void ListView()
        {
            Platforms = new ObservableCollection<Platform>();
            PlatformsAux = service.ConsultLocal();
            for (int i = 0; i < PlatformsAux.Count; i++)
            {
                Platforms.Add(PlatformsAux[i]);
            }
        }

        private async Task ListViewAsync()
        {
            PlatformsTask = service.Consult();
            PlatformsAux = await PlatformsTask;
            if (PlatformsAux.Count > 0)
            {
                Platforms.Clear();
                for (int i = 0; i < PlatformsAux.Count; i++)
                {
                    Platforms.Add(PlatformsAux[i]);
                }
            }
        }

        public bool GoBool { get; set; }

        public Command SaveCommand { get; set; }

        public Command ModifyCommand { get; set; }

        public Command DeleteCommand { get; set; }

        public Command CleanCommand { get; set; }

        public Command GoCommand { get; set; }

        public Command BackCommand { get; set; }

        private async Task Save()
        {
            IsBusy = true;
            Guid idPlatform = Guid.NewGuid();
            model = new Platform()
            {
                Name = Name,
                ReleaseDate = ReleaseDate,
                SoldUnits = SoldUnits,
                Description = Description,
                //Picture = Picture,
                Author = Author,
                Id = idPlatform.ToString()
            };
            if (string.IsNullOrEmpty(model.Name))
            {
                await Application.Current.MainPage.DisplayAlert("Error", "El nombre no puede ser nulo", "Aceptar");
            }
            else
            {
                service.SaveLocal(model);
                //service.Save(model);
                Platforms.Add(model);
                Clean();
            }
            await Task.Delay(2000);
            IsBusy = false;
        }

        private async Task Modify()
        {
            IsBusy = true;
            model = new Platform()
            {
                Name = Name,
                ReleaseDate = ReleaseDate,
                SoldUnits = SoldUnits,
                Description = Description,
                //Picture = Picture,
                Author = Author,
                Id = Id
            };
            service.ModifyLocal(model);
            //service.Modify(model);
            var item = Platforms.FirstOrDefault(i => i.Id == model.Id);
            if (item != null)
            {
                item.Name = model.Name;
                item.ReleaseDate = model.ReleaseDate;
                item.SoldUnits = model.SoldUnits;
                item.Description = model.Description;
                //item.Picture = model.Picture;
                item.Author = model.Author;
            }
            Clean();
            await Task.Delay(2000);
            IsBusy = false;
        }

        private async Task Delete()
        {
            IsBusy = true;
            model = new Platform()
            {
                Name = Name,
                ReleaseDate = ReleaseDate,
                SoldUnits = SoldUnits,
                Description = Description,
                //Picture = Picture,
                Author = Author,
                Id = Id
            };
            service.DeleteLocal(model);
            //service.Delete(model.Id);
            var item = Platforms.FirstOrDefault(i => i.Id == model.Id);
            Platforms.Remove(item);
            Clean();
            await Task.Delay(2000);
            IsBusy = false;
        }

        private void Clean()
        {
            Name = "";
            ReleaseDate = DateTime.Now;
            SoldUnits = 0;
            Description = "";
            Author = "";
            //Picture = null;
            Id = "";
        }

        private void Go()
        {
            if (GoBool == false)
            {
                GoBool = true;
            }
            else
            {
                GoBool = false;
            }
        }

        private void Back()
        {
            Application.Current.MainPage = new NavigationPage(new Main());
        }

    }
}

