<?php
for($i = 10000; $i <= 10060; $i++)
{
copy( 'http://pokeapi.co/media/img/'.$i.'.png', $i.'.png' );
}
?>