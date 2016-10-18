Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f181.google.com ([209.85.223.181]:35135 "EHLO
        mail-io0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754618AbcJRPM4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Oct 2016 11:12:56 -0400
MIME-Version: 1.0
In-Reply-To: <4f2251fc-94ee-41d3-cc03-a39cee5a084c@users.sourceforge.net>
References: <4f2251fc-94ee-41d3-cc03-a39cee5a084c@users.sourceforge.net>
From: Jim Davis <jim.epost@gmail.com>
Date: Tue, 18 Oct 2016 08:12:55 -0700
Message-ID: <CA+r1ZhjmaXi+Nf8vNsMwzfuSkYOByC6D_F=GkehneqfnSO7iCQ@mail.gmail.com>
Subject: Re: Difficulties around "fixdep" for the usage of a kernel build
 output directory
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>, linux-kernel <linux-kernel@vger.kernel.org>

On Tue, Oct 18, 2016 at 6:54 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> Hello,
>
> The file "README" contains a section "BUILD directory for the kernel".
> I would like to use the functionality which is described there.
>
> One of my commands for such a build try is working as desired.
>
>
> elfring@Sonne:~/Projekte/Linux/next-patched> git checkout next-20161014 &=
& my_off=3D-O0 && for X in off; do my_output_dir=3D${my_build_dir}unchanged=
/optimisation/${X} && my_var=3D"my_${X}" && my_parameters=3D"-Wall -std=3Dg=
nu89 -fomit-frame-pointer ${!my_var}" && make O=3D"${my_output_dir}" HOSTCC=
=3D'/usr/bin/gcc-6' HOSTCFLAGS=3D"${my_parameters}" allmodconfig; done
> =E2=80=A6
> #
> # configuration written to .config
> #
>
>
> I stumble on the following messages for another build command.
>
>
> elfring@Sonne:~/Projekte/Linux/next-patched> my_off=3D-O0 && for X in off=
; do my_output_dir=3D${my_build_dir}unchanged/optimisation/${X} && my_var=
=3D"my_${X}" && my_parameters=3D"-Wall -std=3Dgnu89 -fomit-frame-pointer ${=
!my_var}" && LANG=3DC make V=3D2 O=3D"${my_output_dir}" HOSTCC=3D'/usr/bin/=
gcc-6' HOSTCFLAGS=3D"-S ${my_parameters}" drivers/md/; done
> make[1]: Entering directory =E2=80=A6
>   HOSTCC  scripts/basic/fixdep - due to command line change
> scripts/basic/fixdep: line 1: .file: command not found
> scripts/basic/fixdep: line 2: .comm: command not found
> =E2=80=A6
> scripts/basic/fixdep: line 6: .section: command not found
> scripts/basic/fixdep: line 7: .align: command not found
> scripts/basic/fixdep: line 8: .LC0:: command not found
> scripts/basic/fixdep: line 9: .string: command not found
> =E2=80=A6
>
>
> I wonder why this approach does not work so far.
> I would appreciate your advices.

That's a very complicated command line.  Does something basic, like

make O=3D/tmp/$$ allmodconfig
make O=3D/tmp/$$

work for you?

--=20
Jim
