using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using ToDoAPI.API.Models;
using ToDoAPI.DATA.EF;
using System.Web.Http.Cors;

namespace ToDoAPI.API.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ToDoController : ApiController
    {
        //connection to database
        ToDoEntities db = new ToDoEntities();

        //GET - /api/todo
        public IHttpActionResult GetToDo()
        {
            List<ToDoItemsViewModel> todos = db.TodoItems.Include("Category").Select(t => new ToDoItemsViewModel()
            {
                TodoId = t.TodoId,
                Action = t.Action,
                Done = t.Done,
                CategoryId = t.CategoryId,
                Category = new CategoryViewModel()
                {
                    CategoryId = t.Category.CategoryId,
                    Name = t.Category.Name,
                    Description = t.Category.Description
                }

            }).ToList<ToDoItemsViewModel>();

            if (todos.Count == 0)
            {
                return NotFound();
            }
            return Ok(todos);
        }//end of GetToDo()

        //GET api/todo/id
        public IHttpActionResult GetTodo(int id)
        {
            ToDoItemsViewModel todo = db.TodoItems.Include("Category").Where(t => t.TodoId == id).Select(t => new ToDoItemsViewModel()
            {
                TodoId = t.TodoId,
                Action = t.Action,
                Done = t.Done,
                CategoryId = t.CategoryId,
                Category = new CategoryViewModel()
                {
                    CategoryId = t.Category.CategoryId,
                    Name = t.Category.Name,
                    Description = t.Category.Description
                }
            }).FirstOrDefault();

            if (todo == null)
                return NotFound();

            return Ok(todo);
           
        }// end GetTo(id)

        //POST - api/todo (HttpPost)
        public IHttpActionResult PostTodo(ToDoItemsViewModel todo)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest("Invalid Data");
            }//end of if

            TodoItem newTodoItem = new TodoItem()
            {
                TodoId = todo.TodoId,
                Action = todo.Action,
                Done = todo.Done,
                CategoryId = todo.CategoryId
            };

            db.TodoItems.Add(newTodoItem);
            db.SaveChanges();

            return Ok(newTodoItem);

            


        }//end PostTodo()


        public IHttpActionResult PutResource(ToDoItemsViewModel todo)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest("Invalid Data");
            }

            //Get the resource from the db so we can modify it
            TodoItem existingTodo = db.TodoItems.Where(t => t.TodoId == todo.TodoId).FirstOrDefault();

            //modify the resource
            if (existingTodo != null)
            {
                existingTodo.TodoId = todo.TodoId;
                existingTodo.Action = todo.Action;
                existingTodo.Done = todo.Done;
                existingTodo.CategoryId = todo.CategoryId;
                db.SaveChanges();
                return Ok();
            }

            else
            {
                return NotFound();
            }


        }//end of put

         //DELETE - api/Resources/id (HTTPDelete)
        public IHttpActionResult DeleteTodo(int id)
        {
            TodoItem todo = db.TodoItems.Where(r => r.TodoId == id).FirstOrDefault();

            if (todo != null)
            {
                db.TodoItems.Remove(todo);
                db.SaveChanges();
                return Ok();
            }
            else
            {
                return NotFound();
            }
        }//end of DELETE

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }




    }// end of class
}// end of namespace
