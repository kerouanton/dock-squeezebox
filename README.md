# dock-squeezebox-smb
CIFS-mounting container for my Squeezebox server

I'm currently learning Docker and GIT, so I've trying to put something useful here as a first try.

My home music setup consists of several Logitech Squeezeboxes, served by a Logitech Media Server (LMS). The music files (mostly FLAC) are served on a CIFS share on my main NAS.



                                                       .───────────────────────────. 
┌────────────────────┐     ┌───────────────────┐   ┌──▶   Squeezebox Radio room 1   )
│      QNAP NAS      │     │                   │   │   `───────────────────────────' 
│    (CIFS share)    │     │  Logitech Media   │   │   .───────────────────────────. 
│                    │◀────┤      Server       │───┼──▶   Squeezebox Radio room 2   )
│ //qnap2/squeezebox │     │ (Debian Linux VM) │   │   `───────────────────────────' 
│                    │     │                   │   │   .───────────────────────────. 
└────────────────────┘     └───────────────────┘   └──▶   Squeezebox Radio room 3   )
                                                       `───────────────────────────' 