x=c(-12,-19,9,-13,-14,-17,8,-19,-10)
x=sample(-20:20,9,replace = TRUE)

cambiosSigno=function(x){
i=0
  for(k in seq(length(x)-1)){

    if( x[k]*x[k+1]<0 ){
      i=i+1
    }

  }
return(i)
}

cambiosSigno(x)

cambiosSignoPos=function(x){
  pos=c()

  for(k in seq(length(x)-1)){

    if( x[k]*x[k+1]<0 ){
      pos=append(pos,k+1)
    }

  }

  if( is.null(pos) == TRUE){
    print("No hay ningún cambio de signo")
    }else{
      return(pos)
    }
}

cambiosSignoPos(x)
