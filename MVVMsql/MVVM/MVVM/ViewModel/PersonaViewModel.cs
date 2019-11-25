﻿using MVVM.Model;
using MVVM.Service;
using MVVM.View;
using OfficeOpenXml.FormulaParsing.Excel.Functions.Text;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Forms;

namespace MVVM.ViewModel
{
    public class PersonaViewModel: PersonaModel
    {
        public Task<ObservableCollection<Distribuidora>> distribuidoras { get; set; }

        Conexion conexion = new Conexion();

        PersonaModel modelo;

        public PersonaViewModel()
        {
            Empezar();
        }

        private void Empezar()
        {
            //distribuidoras = conexion.ObtenerDistribuidora();
            conexion.Obtain();
            //GuardarCommand = new Command(async () => await Guardar(), () => !IsBusy);
            //ModificarCommand = new Command(async () => await Modificar(), () => !IsBusy);
            //EliminarCommand = new Command(async () => await Eliminar(), () => !IsBusy);
            //LimpiarCommand = new Command(Limpiar, () => !IsBusy);
            //IrCommand = new Command(Ir, () => !IsBusy);
        }

        public bool IrBool { get; set; }

        public Command GuardarCommand { get; set; }

        public Command ModificarCommand { get; set; }

        public Command EliminarCommand { get; set; }

        public Command LimpiarCommand { get; set; }

        public Command IrCommand { get; set; }

        private async Task Guardar()
        {
            IsBusy = true;
            Guid IdPersona = Guid.NewGuid();
            modelo = new PersonaModel()
            {
                Nombre = Nombre,
                Apellido = Apellido,
                Edad = Edad,
                Id = IdPersona.ToString()
            };
            //servicio.Guardar(modelo);
            await Task.Delay(2000);
            IsBusy = false;
        }

        private async Task Modificar()
        {
            IsBusy = true;
            modelo = new PersonaModel()
            {
                Nombre = Nombre,
                Apellido = Apellido,
                Edad = Edad,
                Id = Id
            };
            //servicio.Modificar(modelo);
            await Task.Delay(2000);
            IsBusy = false;
        }

        private async Task Eliminar()
        {
            IsBusy = true;
            //servicio.Eliminar(Id);
            await Task.Delay(2000);
            IsBusy = false;
        }

        private void Limpiar()
        {
            Nombre = "";
            Apellido = "";
            Edad = 0;
            Id = "";
        }

        private void Ir()
        {
            if (IrBool == false)
            {
                IrBool = true;
            } else
            {
                IrBool = false;
            }
        }

    }
}