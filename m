Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44106 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732806AbfC0GR3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 27 Mar 2019 02:17:29 -0400
Date: Wed, 27 Mar 2019 16:17:21 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2] kbuild: strip whitespace in cmd_record_mcount
 findstring
References: <20190325160438.8982-1-joe.lawrence@redhat.com>
        <CAK7LNARyD=tG0JhwN_mjdyDRSPAF8UoZKvqAT3Ah_v7GfymCPg@mail.gmail.com>
        <20190326173308.GA26546@redhat.com>
In-Reply-To: <20190326173308.GA26546@redhat.com>
MIME-Version: 1.0
Message-Id: <1553667417.opxakvn5r6.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Lawrence <joe.lawrence@redhat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Michal Marek <michal.lkml@markovi.net>, Steven Rostedt <rostedt@goodmis.org>

Joe Lawrence's on March 27, 2019 3:33 am:
> On Tue, Mar 26, 2019 at 02:29:47PM +0900, Masahiro Yamada wrote:
>> On Tue, Mar 26, 2019 at 1:05 AM Joe Lawrence <joe.lawrence@redhat.com> w=
rote:
>> >
>> > CC_FLAGS_FTRACE may contain trailing whitespace that interferes with
>> > findstring.
>> >
>> > For example, commit 6977f95e63b9 ("powerpc: avoid -mno-sched-epilog on
>> > GCC 4.9 and newer") introduced a change such that on my ppc64le box,
>> > CC_FLAGS_FTRACE=3D"-pg -mprofile-kernel ".  (Note the trailing space.)
>> > When cmd_record_mcount is now invoked, findstring fails as the ftrace
>> > flags were found at very end of _c_flags, without the trailing space.
>> >
>> >   _c_flags=3D" ... -pg -mprofile-kernel"
>> >   CC_FLAGS_FTRACE=3D"-pg -mprofile-kernel "
>> >                                        ^
>> >     findstring is looking for this extra space
>> >
>> > Remove the redundant whitespaces from CC_FLAGS_FTRACE in
>> > cmd_record_mcount to avoid this problem.
>> >
>> > Fixes: 6977f95e63b9 ("powerpc: avoid -mno-sched-epilog on GCC 4.9 and =
newer").
>> > Signed-off-by: Joe Lawrence <joe.lawrence@redhat.com>
>> > ---
>> >
>> > Standard disclaimer: I'm not a kbuild expert, but this works around th=
e
>> > problem I reported where ftrace and livepatch self-tests were failing =
as
>> > specified object files were not run through the recordmcount.pl script=
:
>> >
>> > ppc64le: ftrace self-tests and $(CC_FLAGS_FTRACE) broken?
>> > https://lists.ozlabs.org/pipermail/linuxppc-dev/2019-March/187298.html
>> >
>> >  scripts/Makefile.build | 8 ++++----
>> >  1 file changed, 4 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
>> > index 2554a15ecf2b..74d402b5aa3c 100644
>> > --- a/scripts/Makefile.build
>> > +++ b/scripts/Makefile.build
>> > @@ -199,10 +199,10 @@ sub_cmd_record_mcount =3D perl $(srctree)/script=
s/recordmcount.pl "$(ARCH)" \
>> >         "$(if $(part-of-module),1,0)" "$(@)";
>> >  recordmcount_source :=3D $(srctree)/scripts/recordmcount.pl
>> >  endif # BUILD_C_RECORDMCOUNT
>> > -cmd_record_mcount =3D                                            \
>> > -       if [ "$(findstring $(CC_FLAGS_FTRACE),$(_c_flags))" =3D   \
>> > -            "$(CC_FLAGS_FTRACE)" ]; then                       \
>> > -               $(sub_cmd_record_mcount)                        \
>> > +cmd_record_mcount =3D                                                =
    \
>> > +       if [ "$(findstring $(strip $(CC_FLAGS_FTRACE)),$(_c_flags))" =
=3D  \
>> > +            "$(strip $(CC_FLAGS_FTRACE))" ]; then                    =
  \
>> > +               $(sub_cmd_record_mcount)                              =
  \
>> >         fi
>> >  endif # CC_USING_RECORD_MCOUNT
>> >  endif # CONFIG_FTRACE_MCOUNT_RECORD
>> > --
>> > 2.20.1
>> >
>>=20
>>=20
>>=20
>> I do not see a point in using the shell command here
>> in the first place.
>>=20
>> Instead of adding crappy workarounds,
>> I guess the following simple code should work:
>>=20
>>=20
>> index 2554a15..5f13021 100644
>> --- a/scripts/Makefile.build
>> +++ b/scripts/Makefile.build
>> @@ -199,11 +199,8 @@ sub_cmd_record_mcount =3D perl
>> $(srctree)/scripts/recordmcount.pl "$(ARCH)" \
>>         "$(if $(part-of-module),1,0)" "$(@)";
>>  recordmcount_source :=3D $(srctree)/scripts/recordmcount.pl
>>  endif # BUILD_C_RECORDMCOUNT
>> -cmd_record_mcount =3D                                            \
>> -       if [ "$(findstring $(CC_FLAGS_FTRACE),$(_c_flags))" =3D   \
>> -            "$(CC_FLAGS_FTRACE)" ]; then                       \
>> -               $(sub_cmd_record_mcount)                        \
>> -       fi
>> +cmd_record_mcount =3D $(if $(findstring $(CC_FLAGS_FTRACE),$(_c_flags))=
,\
>> +                 $(sub_cmd_record_mcount))
>>  endif # CC_USING_RECORD_MCOUNT
>>  endif # CONFIG_FTRACE_MCOUNT_RECORD
>>=20
>=20
> Hi Masahiro,
>=20
> Agreed on the shell command ugliness, however I still think we need to
> strip the search pattern here.  With your suggestion:
>=20
> % rm -f kernel/trace/trace_selftest_dynamic.o=20
> % make kernel/trace/trace_selftest_dynamic.o
>   CALL    scripts/checksyscalls.sh
>   CALL    scripts/atomic/check-atomics.sh
>   CC      kernel/trace/trace_selftest_dynamic.o
>=20
> % eu-readelf --sections kernel/trace/trace_selftest_dynamic.o | grep mcou=
nt
> (nothing)
>=20
> Adding it back as, as below, restores those sections and the self tests
> work again.

Thanks for finding and fixing this, nice work!

Thanks,
Nick

>=20
> Regards,
>=20
> -- Joe
>=20
> -->8-- -->8-- -->8-- -->8-- -->8-- -->8-- -->8-- -->8-- -->8-- -->8--
>=20
> From 6a85e8ecf4179b3e80601a327ec43d8d49f0e3cd Mon Sep 17 00:00:00 2001
> From: Joe Lawrence <joe.lawrence@redhat.com>
> Date: Tue, 26 Mar 2019 10:50:28 -0400
> Subject: [PATCH v2] kbuild: strip whitespace in cmd_record_mcount findstr=
ing
>=20
> CC_FLAGS_FTRACE may contain trailing whitespace that interferes with
> findstring.
>=20
> For example, commit 6977f95e63b9 ("powerpc: avoid -mno-sched-epilog on
> GCC 4.9 and newer") introduced a change such that on my ppc64le box,
> CC_FLAGS_FTRACE=3D"-pg -mprofile-kernel ".  (Note the trailing space.)
> When cmd_record_mcount is now invoked, findstring fails as the ftrace
> flags were found at very end of _c_flags, without the trailing space.
>=20
>   _c_flags=3D" ... -pg -mprofile-kernel"
>   CC_FLAGS_FTRACE=3D"-pg -mprofile-kernel "
>                                        ^
>     findstring is looking for this extra space
>=20
> Remove the redundant whitespaces from CC_FLAGS_FTRACE in
> cmd_record_mcount to avoid this problem.
>=20
> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com> (refactorin=
g)
> Fixes: 6977f95e63b9 ("powerpc: avoid -mno-sched-epilog on GCC 4.9 and new=
er").
> Signed-off-by: Joe Lawrence <joe.lawrence@redhat.com>
> ---
>  scripts/Makefile.build | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 2554a15ecf2b..76ca30cc4791 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -199,11 +199,8 @@ sub_cmd_record_mcount =3D perl $(srctree)/scripts/re=
cordmcount.pl "$(ARCH)" \
>  	"$(if $(part-of-module),1,0)" "$(@)";
>  recordmcount_source :=3D $(srctree)/scripts/recordmcount.pl
>  endif # BUILD_C_RECORDMCOUNT
> -cmd_record_mcount =3D						\
> -	if [ "$(findstring $(CC_FLAGS_FTRACE),$(_c_flags))" =3D	\
> -	     "$(CC_FLAGS_FTRACE)" ]; then			\
> -		$(sub_cmd_record_mcount)			\
> -	fi
> +cmd_record_mcount =3D $(if $(findstring $(strip $(CC_FLAGS_FTRACE)),$(_c=
_flags)),	\
> +	$(sub_cmd_record_mcount))
>  endif # CC_USING_RECORD_MCOUNT
>  endif # CONFIG_FTRACE_MCOUNT_RECORD
> =20
> --=20
> 2.20.1
>=20
>=20
=
