define lumberjack::file (
    $paths,
    $fields,
){
    
    File {
        owner => 'root',
        group => 'root',
    }

    if ($paths != '') {
        validate_array($paths)
    }
    if ($fields != ''){
        validate_hash($fields)
    }
 
    if ($lumberjack::ensure == 'present' ) { 
        concat::fragment{"${name}":
            target  => "${lumberjack::params::config}/lumberjack.conf",
            content => template("${module_name}/file_format.erb"),
            order   => 010,
        }
    }
}
