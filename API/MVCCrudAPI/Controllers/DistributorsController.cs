﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using MVCCrudAPI.Models;

namespace MVCCrudAPI.Controllers
{
    public class DistributorsController : ApiController
    {
        private VideogamesDBEntities db = new VideogamesDBEntities();

        // GET: api/Distributors
        public IQueryable<Distribuidora> GetDistribuidora()
        {
            return db.Distribuidora;
        }

        // GET: api/Distributors/5
        [ResponseType(typeof(Distribuidora))]
        public IHttpActionResult GetDistribuidora(string id)
        {
            Distribuidora distribuidora = db.Distribuidora.Find(id);
            if (distribuidora == null)
            {
                return NotFound();
            }

            return Ok(distribuidora);
        }

        // PUT: api/Distributors/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutDistribuidora(string id, Distribuidora distribuidora)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != distribuidora.Id)
            {
                return BadRequest();
            }

            db.Entry(distribuidora).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!DistribuidoraExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Distributors
        [ResponseType(typeof(Distribuidora))]
        public IHttpActionResult PostDistribuidora(Distribuidora distribuidora)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Distribuidora.Add(distribuidora);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (DistribuidoraExists(distribuidora.Id))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = distribuidora.Id }, distribuidora);
        }

        // DELETE: api/Distributors/5
        [ResponseType(typeof(Distribuidora))]
        public IHttpActionResult DeleteDistribuidora(string id)
        {
            Distribuidora distribuidora = db.Distribuidora.Find(id);
            if (distribuidora == null)
            {
                return NotFound();
            }

            db.Distribuidora.Remove(distribuidora);
            db.SaveChanges();

            return Ok(distribuidora);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool DistribuidoraExists(string id)
        {
            return db.Distribuidora.Count(e => e.Id == id) > 0;
        }
    }
}