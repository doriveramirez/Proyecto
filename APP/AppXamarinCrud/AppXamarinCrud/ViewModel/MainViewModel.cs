﻿using AppXamarinCrud.Service;
using MVVM.View;
using System;
using System.Collections.Generic;
using System.Text;
using Xamarin.Forms;

namespace AppXamarinCrud.ViewModel
{
    class MainViewModel
    {

        MainService service = new MainService();

        public MainViewModel()
        {
            VideogamesButton = new Command(Videogames);
            PlatformsButton = new Command(Platforms);
            DistributorsButton = new Command(Distributors);
            CompaniesButton = new Command(Companies);
            ReviewsButton = new Command(Reviews);
            UsersButton = new Command(Users);
            OptionsButton = new Command(Options);
            ExitButton = new Command(Exit);
        }

        private void Videogames()
        {

        }
        private void Platforms()
        {

        }
        private void Distributors()
        {
            service.OptionSelected("Distributors");
        }
        private void Companies()
        {

        }
        private void Reviews()
        {

        }
        private void Users()
        {

        }
        private void Options()
        {

        }
        private void Exit()
        {
            service.OptionSelected("Exit");
        }

        public Command VideogamesButton { get; set; }

        public Command PlatformsButton { get; set; }

        public Command DistributorsButton { get; set; }

        public Command CompaniesButton { get; set; }

        public Command ReviewsButton { get; set; }

        public Command UsersButton { get; set; }

        public Command OptionsButton { get; set; }

        public Command ExitButton { get; set; }
    }
}
