using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ToDoAPI.API.Models
{
    public class CategoryViewModel
    {
        public int CategoryId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }

        public virtual ToDoViewModel ToDo { get; set; }
    }

    //public class ToDoViewModel
    //{
    //    public int TodoId { get; set; }
    //    public string Action { get; set; }
    //    public bool Done { get; set; }
    //    public int CategoryId { get; set; }
    //}
}