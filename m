Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f173.google.com ([209.85.223.173]:35795 "EHLO
        mail-io0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753537AbcJRQui (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Oct 2016 12:50:38 -0400
MIME-Version: 1.0
In-Reply-To: <1238ba8e-a297-6de5-2e6a-50e6e72e77d3@users.sourceforge.net>
References: <4f2251fc-94ee-41d3-cc03-a39cee5a084c@users.sourceforge.net>
 <CA+r1ZhjmaXi+Nf8vNsMwzfuSkYOByC6D_F=GkehneqfnSO7iCQ@mail.gmail.com> <1238ba8e-a297-6de5-2e6a-50e6e72e77d3@users.sourceforge.net>
From: Jim Davis <jim.epost@gmail.com>
Date: Tue, 18 Oct 2016 09:50:36 -0700
Message-ID: <CA+r1ZhhqEBvV0ivz=MvaHhRquhFS2mxddJ-GOx81ZeSerKsD3g@mail.gmail.com>
Subject: Re: Difficulties around "fixdep" for the usage of a kernel build
 output directory
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>, linux-kernel <linux-kernel@vger.kernel.org>

On Tue, Oct 18, 2016 at 9:38 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
>>> elfring@Sonne:~/Projekte/Linux/next-patched> my_off=3D-O0 && for X in o=
ff; do my_output_dir=3D${my_build_dir}unchanged/optimisation/${X} && my_var=
=3D"my_${X}" && my_parameters=3D"-Wall -std=3Dgnu89 -fomit-frame-pointer ${=
!my_var}" && LANG=3DC make V=3D2 O=3D"${my_output_dir}" HOSTCC=3D'/usr/bin/=
gcc-6' HOSTCFLAGS=3D"-S ${my_parameters}" drivers/md/; done
> =E2=80=A6
>> That's a very complicated command line.
>
> I find it "advanced".
>
> It shows a few of my imaginations around a specific software development =
task.
>
>
>> Does something basic, like
>>
>> make O=3D/tmp/$$ allmodconfig
>> make O=3D/tmp/$$
>>
>> work for you?
>
> Not really. - I would like to achieve the automatic selection of a few
> compilation settings by a for loop which I reduced in the shown example
> to one element.

Fine, but my point was to check that the basic things worked before
trying the complicated, or "advanced" stuff.  If, somehow, fixdep
didn't work in a basic setup then you'd know it wasn't one of your
advanced features that was causing the problem.

And if fixdep did work with a basic setup , then that would suggest
something wrong with your advanced command line.
--=20
Jim
