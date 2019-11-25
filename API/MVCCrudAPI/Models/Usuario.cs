//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MVCCrudAPI.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Usuario
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Usuario()
        {
            this.Videojuego = new HashSet<Videojuego>();
        }
    
        public string Id { get; set; }
        public string Nombre { get; set; }
        public Nullable<System.DateTime> FechaNac { get; set; }
        public string Dni { get; set; }
        public string Password { get; set; }
        public string Usuario1 { get; set; }
        public string CompanyID { get; set; }
        public byte[] Imagen { get; set; }
    
        public virtual Company Company { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Videojuego> Videojuego { get; set; }
    }
}