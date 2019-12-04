﻿using AppXamarinCrud.Model;
using AppXamarinCrud.ViewModel;
using MVVM.View;
using MVVM.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace AppXamarinCrud.View
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class Distributors : ContentPage
    {
        DistributorsViewModel Context = new DistributorsViewModel();

        public Distributors()
        {
            InitializeComponent();
            BindingContext = Context;
            LvDistributors.ItemSelected += LvDistributors_ItemSelected;
        }

        private void LvDistributors_ItemSelected(object sender, SelectedItemChangedEventArgs e)
        {
            if (e.SelectedItem != null)
            {
                Distributor model = (Distributor)e.SelectedItem;
                if (Context.GoBool)
                {
                    ((ListView)sender).SelectedItem = null;
                    //Navigation.PushAsync(new DetallePage(model));
                }
                Context.Nombre = model.Name;
                Context.NumeroJuegosPublicados = model.NumeroJuegosPublicados;
                Context.Imagen = model.Imagen;
                Context.Id = model.Id;
            }
        }
    }
}