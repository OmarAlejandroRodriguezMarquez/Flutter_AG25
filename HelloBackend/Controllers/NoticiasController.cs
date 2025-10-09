using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;

[ApiController]
[Route("api/[controller]")]
public class NoticiasController : ControllerBase
{
    List<Noticia> misNotcias = new List<Noticia>();

    [HttpGet("todas")]
    public ActionResult<List<Noticia>> GetNoticias()
    {
        asignarNoticias();
        return misNotcias;
    }

    [HttpGet("ninguna")]
    public ActionResult<List<Noticia>> GetNingunaNoticia()
    {
        asignarNoticias();
        misNotcias = new List<Noticia>();
        if (misNotcias.Count == 0)
        {
            return NotFound();
        }
        return Ok(misNotcias);
    }

    private void asignarNoticias()
    {
        List<Noticia> noticias = new List<Noticia>();

        noticias.Add(new Noticia
        {
            Id = 1,
            Titulo = "Noticia 1",
            Contenido = "Contenido de la noticia 1",
            Tipo = "Deportes",
            Fecha = new DateTime(2025, 8, 15)
        });

        noticias.Add(new Noticia
        {
            Id = 2,
            Titulo = "Noticia 2",
            Contenido = "Contenido de la noticia 2",
            Tipo = "Nacional",
            Fecha = new DateTime(2025, 9, 15)
        });
        noticias.Add(new Noticia
        {
            Id = 3,
            Titulo = "Noticia 3",
            Contenido = "Contenido de la noticia 3",
            Tipo = "Internacional",
            Fecha = new DateTime(2025, 2, 15)
        });
        noticias.Add(new Noticia
        {
            Id = 4,
            Titulo = "Noticia 4",
            Contenido = "Contenido de la noticia 4",
            Tipo = "Deportes",
            Fecha = new DateTime(2024, 8, 15)
        });
        noticias.Add(new Noticia
        {
            Id = 5,
            Titulo = "Noticia 5",
            Contenido = "Contenido de la noticia 5",
            Tipo = "Finanzas",
            Fecha = new DateTime(2025, 8, 02)
        });

        misNotcias = noticias;
    }

}