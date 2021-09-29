#!/bin/bats

examplefile=https://thisfile.pdf
@test "Find file with specified extension." {
    result="$(./findurl.sh --ext=pdf $examplefile)"
    [ "$result" == "$examplefile" ]
}

@test "Fail to find file without specified extension." {
    result="$(./findurl.sh --ext=txt $examplefile)"
    [ -z "$result" ]
}

@test "Find file without specifying extension." {
    result="$(./findurl.sh $examplefile)"
    [ "$result" == "$examplefile" ]
}

httpfile=http://thisfile.pdf
@test "find file with http" {
    result="$(./findurl.sh $httpfile)"
    [ "$result" == "$httpfile" ]
}

noextfile=http://doi.org/thisfiles
@test "Find file without extension" {
    result="$(./findurl.sh $noextfile)"
    [ "$result" == "$noextfile" ]
}
