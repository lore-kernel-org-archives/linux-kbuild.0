Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f195.google.com ([209.85.160.195]:46360 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbfEQS1g (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 May 2019 14:27:36 -0400
From: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Date: Fri, 17 May 2019 14:37:06 -0300
In-Reply-To: <CABWYdi2Xsp4AUhV1GwphTd4-nN2zCZMmg5y7WheNc67KrdVBfw@mail.gmail.com>
References: <CANiq72kvpiC-i53AXM-YsCUvWroHQemmqxsXjnB330ZEeHahUg@mail.gmail.com> <CABWYdi1zhTTaN-GSgH0DnPfz7p=SRw0wts5QVYYVtfvoiS0qnQ@mail.gmail.com> <CANiq72=fsL5m2_e+bNovFCHy3=YVf53EKGtGE_sWvsAD=ONHuQ@mail.gmail.com> <20190516225013.nvhwqi5tfwtby6qb@treble> <CABWYdi29E++jBw8boFZAiDZA7iT5NiJhnNmiHb-Rvd9+97hSVA@mail.gmail.com> <20190517050931.GB32367@kroah.com> <20190517073813.GB2589@hirez.programming.kicks-ass.net> <CANiq72nUPoNHWM-dJuFc3=4D2=8XMuvO0PgGPjviOv+EhrAWUw@mail.gmail.com> <20190517085126.GA3249@kroah.com> <CANiq72muyjE3XPjmtQgJpGaqWR=YBi6KVNT3qe-EMXP7x+q_rQ@mail.gmail.com> <20190517152200.GI8945@kernel.org> <CABWYdi2Xsp4AUhV1GwphTd4-nN2zCZMmg5y7WheNc67KrdVBfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: Linux 4.19 and GCC 9
Message-ID: <4FE2D490-F379-4CAE-9784-9BF81B7FE258@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ivan Babrou <ivan@cloudflare.com>, Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Greg KH <gregkh@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Ingo Molnar <mingo@redhat.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, kernel-team <kernel-team@cloudflare.com>

On May 17, 2019 2:23:10 PM GMT-03:00, Ivan Babrou <ivan@cloudflare=2Ecom> w=
rote:
>On Fri, May 17, 2019 at 8:22 AM Arnaldo Carvalho de Melo
><arnaldo=2Emelo@gmail=2Ecom> wrote:
>>
>> Em Fri, May 17, 2019 at 11:01:45AM +0200, Miguel Ojeda escreveu:
>> > On Fri, May 17, 2019 at 10:51 AM Greg KH
><gregkh@linuxfoundation=2Eorg> wrote:
>> > >
>> > > On Fri, May 17, 2019 at 10:35:29AM +0200, Miguel Ojeda wrote:
>> > > > On Fri, May 17, 2019 at 9:38 AM Peter Zijlstra
><peterz@infradead=2Eorg> wrote:
>> > > > >
>> > > > > Right; if there is anything you can reproduce on linus=2Egit
>I'll happily
>> > > > > have a look=2E If it doesn't reproduce all you have to do is
>find the
>> > > > > patches that make it work and ask Greg=2E
>> > > >
>> > > > Just to clarify: Linus' master is clean of these issues with
>GCC 9=2E1=2E1=2E
>> > >
>> > > Great!  Care to find the patches that did that work and send me
>the git
>> > > commit ids so that I can queue them up?  I don't have gcc9 here
>yet on
>> > > my systems, so I can not test for this=2E
>> >
>> > I am unsure about the perf and the objtools parts (Peter/Josh?),
>but
>>
>> I'm not noticing these while building upstream perf with gcc 9=2E1=2E1 =
on
                                                                       ^^^=
^^^^^^^^^^^^

>at
>> least fedora:30=2E
>>
>>     33  fedora:30                     : Ok   gcc (GCC) 9=2E1=2E1 201905=
03
>(Red Hat 9=2E1=2E1-1)
>
>I've tried to replicate this in fedora:30 docker container and it's
>there:
>
>[root@linuxkit-025000000001 perf]# gcc --version
>gcc (GCC) 9=2E1=2E1 20190503 (Red Hat 9=2E1=2E1-1)
>
>[root@linuxkit-025000000001 perf]# pwd
>/tmp/linux-4=2E19=2E44/tools/perf
             ^^^^^^^^^^^^^^

That is not upstream perf, please look for patches from 4=2E19 to Linus' m=
aster Branch for fixes=2E

I'll triple check here in a f30 container just in case meanwhile=2E

Thanks,

- Arnaldo
>
>[root@linuxkit-025000000001 perf]# make -j1
>=2E=2E=2E
>trace/beauty/ioctl=2Ec: In function =E2=80=98ioctl__scnprintf_kvm_cmd=E2=
=80=99:
>trace/beauty/ioctl=2Ec:85:82: error: array subscript [-2147483648, -1]
>is outside array bounds of =E2=80=98const char *[0]=E2=80=99 [-Werror=3Da=
rray-bounds]
>   85 |  if (nr < strarray__kvm_ioctl_cmds=2Enr_entries &&
>strarray__kvm_ioctl_cmds=2Eentries[nr] !=3D NULL)
>      |
>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
>In file included from trace/beauty/ioctl=2Ec:82:
>/tmp/linux-4=2E19=2E44/tools/perf/trace/beauty/generated/ioctl/kvm_ioctl_=
array=2Ec:1:20:
>note: while referencing =E2=80=98kvm_ioctl_cmds=E2=80=99
>    1 | static const char *kvm_ioctl_cmds[] =3D {
>      |                    ^~~~~~~~~~~~~~
>In file included from /usr/include/string=2Eh:494,
>                 from util/debug=2Eh:7,
>                 from builtin-help=2Ec:15:
>In function =E2=80=98strncpy=E2=80=99,
>    inlined from =E2=80=98add_man_viewer=E2=80=99 at builtin-help=2Ec:192=
:2,
>    inlined from =E2=80=98perf_help_config=E2=80=99 at builtin-help=2Ec:2=
84:3:
>/usr/include/bits/string_fortified=2Eh:106:10: error:
>=E2=80=98__builtin_strncpy=E2=80=99 output truncated before terminating n=
ul copying as
>many bytes from a string as its length [-Werror=3Dstringop-truncation]
>106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos
>(__dest));
>|        =20
>^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>builtin-help=2Ec: In function =E2=80=98perf_help_config=E2=80=99:
>builtin-help=2Ec:187:15: note: length computed here
>  187 |  size_t len =3D strlen(name);
>      |               ^~~~~~~~~~~~
>trace/beauty/ioctl=2Ec: In function =E2=80=98ioctl__scnprintf_perf_cmd=E2=
=80=99:
>trace/beauty/ioctl=2Ec:109:84: error: array subscript [-2147483648, -1]
>is outside array bounds of =E2=80=98const char *[0]=E2=80=99 [-Werror=3Da=
rray-bounds]
>  109 |  if (nr < strarray__perf_ioctl_cmds=2Enr_entries &&
>strarray__perf_ioctl_cmds=2Eentries[nr] !=3D NULL)
>      |
>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
>In file included from trace/beauty/ioctl=2Ec:106:
>/tmp/linux-4=2E19=2E44/tools/perf/trace/beauty/generated/ioctl/perf_ioctl=
_array=2Ec:1:20:
>note: while referencing =E2=80=98perf_ioctl_cmds=E2=80=99
>    1 | static const char *perf_ioctl_cmds[] =3D {
>      |                    ^~~~~~~~~~~~~~~
>cc1: all warnings being treated as errors
>
>> > about the -Wmissing-attributes I cleaned, they were these:
>>
>> > a6e60d84989f ("include/linux/module=2Eh: copy __init/__exit attrs to
>> > init/cleanup_module")
>> > c0d9782f5b6d ("Compiler Attributes: add support for __copy (gcc >=3D
>9)")
>> > ff98e20ef208 ("lib/crc32=2Ec: mark crc32_le_base/__crc32c_le_base
>> > aliases as __pure")
>> >
>> > Cheers,
>> > Miguel
>>
>> --
>>
>> - Arnaldo
