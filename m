Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794659015;
	b=1BhBmMKfHESzmHU1UgnXIzG+8ukp9CpnMl9erdwFUQGzTSuWWWYG+KIzKZL/4L28+Qix
	 1vBccI1+vfiad+Lcf2G+NyVClYXAL7s7Aolc6tmrrWcTwnFxnkRm17GwAz8h2mvYzZIYa
	 CDDCoHgjaRJq0FpqVcJrFdpWVB4ROGW+RiBZ9qgYYvmBEtpDTE82KES8+RKRRLbo9bKPB
	 dIv2pQ5vIO7y3jfyvCuRTiAPcUFTmeDWBPR/0HxOOmMts5ua5dud7ixKi+UXe9qxfaElS
	 wU2ryjqJ+HIHRNrq+/C0+4BK0t32mu6KDL18jd3Jc5nUwBRHmskTpe9BnDHmUOR2w/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794659015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=IizdEEL0itbjhQmiBU2ODo+F4UyPMtfQyuuwWVoFPFE=;
	b=Xjtd2WJmTMSRpqsdszod1IfSoSPAovl0lOT6FtIU93xXlmZqTp7rvv62GiFKHfDrGU2Z
	 FMxFGy5XFl0qq57o2x3FqIer/VhL9LP0NQpq8cPc0hFetf47Epy3nzDqmV5F4oS7cqubg
	 SRw8xaQux2hrQwfGiB50oIZb6feWuy2ZfFkcif4lCJmCBWzxjprexqkSW0rz0joeEGYKY
	 cgzaXCM16o6TBFsxOkjxBhlN1cHuuyOO3UZoFPELDisKcxK9yMillwPnSLNEhmuaT/HGv
	 BcsvptkUROViBHWPJf84gHqOB4wOQV6hXqRIn0uDKrVOL+AIA1O9Lp5lhKpM8o/k0Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W8BC9WV1;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36F7606A32D
	for <linux-kbuild@vger.kernel.org>; Sat, 14 Nov 2026 12:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D36F7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W8BC9WV1
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e09aa5264so855301f8f.2
        for <linux-kbuild@vger.kernel.org>; Sat, 14 Nov 2026 04:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794659013; x=1795263813; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IizdEEL0itbjhQmiBU2ODo+F4UyPMtfQyuuwWVoFPFE=;
        b=W8BC9WV1LjWQgIKWnq6c/2ZQ62sY+E/6K2Nvt8y7T7KRslM/HnbRMZ5AlHpwOW0soC
         p6O0BMEZGfrvYnwRFD/ZAAyz4VrjY7f2bRiqtwV7exlK6lvb1WSKG0GM9uEYuV7lS31J
         SLXNwI/ABtultKCiad/j063kxHZXSwqqYuOlNDJurACBC/zAT/5hEJzCO7wTFY6mpBfV
         SZFAYGboWma+jfo5cLG722PoD/isg6ZXhGd+9GYHQ6+RzOhBx4epLgjjpL7wm8S/c7ph
         gJlGgiXcVqIsbSHNwm5bXDcMu2FKc4MDmRjnE9P69qq/PMAsO4c6MGXxr1hH9NGw2u2R
         nuUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794659013; x=1795263813;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IizdEEL0itbjhQmiBU2ODo+F4UyPMtfQyuuwWVoFPFE=;
        b=R9cLRbZ2+g6hamvW8v6KHbstQKuhbJ+Pu1Zk+Ha2w9+wDX5APApgPJ8Leqkdn97TTL
         5Nsy3CDErr8bdpm8OSU1mVsNK1QUshiI7L8rZBIuTaiChMjocl7v/u5CYC6Qp723Zngy
         6RJPkk6YmPFxktujZx4ICStPBn0rjB7ZPsn+Y4/72qJ004BZVR1H3ok/5aOwU8/eBV0O
         E+IessyOfmLM+e20O3sNp21r5PethjxDWvyrK7VOjG8NbHyoCo+0qG8zlwrGEkbE+IMs
         R6gND9E01Hcmd4Pc32svilZmo+71WzEWF16ycjA6+ktK2jC0D+WfaUgi5m6lJmt90UEV
         nZBA==
X-Forwarded-Encrypted: i=1; AL+hErH+Lv3/fG2vzwPIQU0yDWEJFThVYui1mhY1NmjkhSuj1XvMPqgbITyid/kwpsA12iVwr6SQNRHQvIRKNCM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VrK82m3ckzQV7ksI3WyOOrpkt3kyZd8vId/tg37HMtLvjn+mD
	PMT8u3xQjjVzxMQhVx2yjChs+fUSJMiLz7uUzJpFPcYgGL08tuJEDtVs
X-Gm-Gg: AYBFou3ANM0+2vptiWa+1/JvgZWT6Nit8rgcbIHbVmUQ3qaTslJYYgSEkRsLyhLlbKx
	rwuFPOGScBPPva5FXQZ91thNNiKy78IeS1LvIQSkp4TbfnIijJjZqKbBt/4preOVxDu/9PKN5XD
	cdcZeoQwv+GVCbUjd3ZBwW9Hy4zej58nDL2YTrQP99xVgS5GcdS2ivn3omKFggxazZHbkcBRNsd
	Kdo6Vd7L6c9ZjMobIM522m6/NCJoXugV/JseD0/Z22foMxYAJmvNcujV2qfvbdrtldzyADQ9Pnb
	tgosVIs2SJkqFCHS+HAdwEArVhtklA4oPJygxeqXJNf6FWCgiTRgvZZMNlW6twESwZA4ct6yUen
	t9o+U/xxgCcAqVXHwIGPYeo01JVQe77fRM6pQrRI4CvT87uShegV3Ql80PfiLyqgs5s4Q1+Ir84
	yWWCtoPAU+WGG6Am1voO6CQKcebXMkyGvAAcHEkAkyM/Vt67yZKzSdPv7G/eaOMyTn9Hh+BOnCA
	RvzN0Wa86oaR09jBSNnmZhvcxfWMV3+84cD5ZZO8QtM640UL43CCTacxDdkP1ar5V1bPZEPRsa2
	VHy+OcQ5v7+dG3DXRXGajZq8n5A3Qs60RH+NWjaA4omaLnZLUCF1IyWmaCoaZrIJng==
X-Received: by 2002:adf:f14b:0:b0:492:dddc:64c3 with SMTP id ffacd0b85a97d-49c742a6580mr8857073f8f.41.1794659013008;
        Sat, 14 Nov 2026 04:23:33 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49dc430fa15sm4721751f8f.13.2026.11.14.04.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 04:23:32 -0800 (PST)
Date: Sat, 14 Nov 2026 12:23:31 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Samuel Wu <wusamuel@google.com>
Cc: Petr Mladek <pmladek@suse.com>, Kees Cook <kees@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 bpf@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>, Lorenzo Stoakes
 <ljs@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Andrey Grodzovsky
 <andrey.grodzovsky@crowdstrike.com>, Steven Rostedt <rostedt@goodmis.org>,
 Andrii Nakryiko <andrii@kernel.org>, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 next 09/13] kallsyms: Add a kernel parameter to
 change the kallsyms_markers[] density
Message-ID: <20261114122331.25e01f0c@pumpkin>
In-Reply-To: <CAG2KctruqvRDU46Q58Sk3Bkr=i1yuhs8znqgWWP65ZydBnT+Hw@mail.gmail.com>
References: <20261111115911.1142000-1-david.laight.linux@gmail.com>
	<20261111115911.1142000-10-david.laight.linux@gmail.com>
	<CAG2KctruqvRDU46Q58Sk3Bkr=i1yuhs8znqgWWP65ZydBnT+Hw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 13 Nov 2026 17:01:56 -0800
Samuel Wu <wusamuel@google.com> wrote:

> On Wed, Nov 11, 2026 at 3:59=E2=80=AFAM David Laight
> <david.laight.linux@gmail.com> wrote:
> >
> > The density is a tradeoff between data size and execution speed.
> > Reducing it from 256 to 64 gives a 35% improvement for name lookups.
> >
> > Change scripts/kallsyms to take the density from a --marker-shift comma=
nd
> > line parameter so that it can be build specific.
> > Write the value used to the output file to ensure the kernel uses the
> > correct value.
> >
> > The program's default is unchanged at 1 marker per 256 symbols,
> > The kernel config defaults to 1 marker per 64 symbols.
> > This increases the static data by a little less than 1 bit for every
> > two symbols.
> >
> > Signed-off-by: David Laight <david.laight.linux@gmail.com>
> > ---
> >
> > v3: Previously patches 8 and 9
> >
> >  init/Kconfig               | 19 +++++++++++++++
> >  kernel/kallsyms.c          | 16 ++++++-------
> >  kernel/kallsyms_internal.h |  1 +
> >  scripts/kallsyms.c         | 49 ++++++++++++++++++++++++++------------
> >  scripts/link-vmlinux.sh    |  6 +++++
> >  5 files changed, 67 insertions(+), 24 deletions(-)
> >
> > diff --git a/init/Kconfig b/init/Kconfig
> > index 4013781e0a02..b2db123a51d7 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -1908,6 +1908,25 @@ config KALLSYMS
> >           symbolic stack backtraces. This increases the size of the ker=
nel
> >           somewhat, as all symbols have to be loaded into the kernel im=
age.
> >
> > +config KALLSYMS_MARKER_SHIFT
> > +       int "Interval between kallsyms markers (6 =3D> 64, 8 =3D> 256)"
> > +       depends on KALLSYMS
> > +       default 6
> > +       range 0 24
> > +       help
> > +         Set the interval between the kallsyms marker entries as a pow=
er of 2.
> > +
> > +         This bounds the linear search when locating the name of a sym=
bol
> > +         from its index in the array of values (and v.v.).
> > +
> > +         Smaller values speed up the search but increase the memory fo=
otprint.
> > +         Values below 5 (one 32 bit marker every 32 symbols) are unlik=
ely to
> > +         make a significant difference because other parts of the code
> > +         dominate.
> > +
> > +         The default of 6 is a reasonable compromise. It makes looking=
 up a
> > +         symbol by name around 35% faster than setting it to 8.
> > +
> >  config KALLSYMS_SELFTEST
> >         bool "Test the basic functions and performance of kallsyms"
> >         depends on KALLSYMS
> > diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
> > index fd42a1a8ed3e..2c4264a3e0c5 100644
> > --- a/kernel/kallsyms.c
> > +++ b/kernel/kallsyms.c
> > @@ -147,13 +147,11 @@ static int kallsyms_strcmp_symbol(unsigned int of=
f, const char *name)
> >  static unsigned int get_symbol_offset(unsigned long pos)
> >  {
> >         const u8 *name;
> > -       int i, len;
> > +       int len;
> >
> > -       /*
> > -        * Use the closest marker we have. We have markers every 256 po=
sitions,
> > -        * so that should be close enough.
> > -        */
> > -       name =3D &kallsyms_names[kallsyms_markers[pos >> 8]];
> > +       /* Scan from the marker before the requested symbol number */
> > +       name =3D &kallsyms_names[kallsyms_markers[pos >> kallsyms_marke=
r_shift]];
> > +       pos &=3D (1 << kallsyms_marker_shift) - 1;
> >
> >         /*
> >          * Sequentially scan all the symbols up to the point we're sear=
ching
> > @@ -161,7 +159,7 @@ static unsigned int get_symbol_offset(unsigned long=
 pos)
> >          * so we just need to add the len to the current pointer for ev=
ery
> >          * symbol we wish to skip.
> >          */
> > -       for (i =3D 0; i < (pos & 0xFF); i++) {
> > +       while (pos--) {
> >                 len =3D *name;
> >
> >                 /*
> > @@ -185,7 +183,7 @@ static unsigned long get_name_address(unsigned int =
name_offset)
> >         unsigned int low, pos, high;
> >
> >         low =3D 0;
> > -       high =3D ((kallsyms_num_syms - 1) >> 8) + 1;
> > +       high =3D ((kallsyms_num_syms - 1) >> kallsyms_marker_shift) + 1;
> >
> >         while (high - low > 1) {
> >                 pos =3D low + (high - low) / 2;
> > @@ -196,7 +194,7 @@ static unsigned long get_name_address(unsigned int =
name_offset)
> >         }
> >
> >         pos =3D kallsyms_markers[low];
> > -       for (low <<=3D 8; pos < name_offset; low++) {
> > +       for (low <<=3D kallsyms_marker_shift; pos < name_offset; low++)=
 {
> >                 unsigned int len =3D kallsyms_names[pos];
> >                 if (len & 0x80)
> >                         len +=3D (kallsyms_names[pos + 1] << 7) - 0x7f;
> > diff --git a/kernel/kallsyms_internal.h b/kernel/kallsyms_internal.h
> > index 11fb0de92ede..9137870ad00f 100644
> > --- a/kernel/kallsyms_internal.h
> > +++ b/kernel/kallsyms_internal.h
> > @@ -12,6 +12,7 @@ extern const unsigned int kallsyms_num_syms;
> >  extern const char kallsyms_token_table[];
> >  extern const u16 kallsyms_token_index[];
> >
> > +extern const unsigned int kallsyms_marker_shift;
> >  extern const unsigned int kallsyms_markers[];
> >
> >  /* Although constant, size is volatile for better code generation. */
> > diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> > index 930ec27a53c0..c27aaabccd1b 100644
> > --- a/scripts/kallsyms.c
> > +++ b/scripts/kallsyms.c
> > @@ -59,6 +59,8 @@ static unsigned int table_size, table_cnt;
> >  static int all_symbols;
> >  static int pc_relative;
> >  static int verbose;
> > +/* Default to one kallsyms_markers[] entry for each 256 symbols */
> > +static unsigned long marker_shift =3D 8;
> >
> >  static int big_endian; /* Extracted from the elf file */
> >
> > @@ -441,8 +443,8 @@ static void write_src(void)
> >         stamp("write token table");
> >
> >         /* table of offset markers, that give the offset in the compres=
sed stream
> > -        * every 256 symbols */
> > -       markers_cnt =3D (table_cnt + 255) / 256;
> > +        * every (1 << marker_shift) (typically 64 or 256) symbols */
> > +       markers_cnt =3D (table_cnt + 255) >> marker_shift; =20
>=20
> Should be (table_cnt + (1 << marker_shift) - 1) >> marker_shift.

Sashiko noticed that as well.
I'm going to overallocate the array and count the values as they go in.
Less messy that way.

David

>=20
> Otherwise, looks good to me!
>=20
> >         markers =3D xmalloc(sizeof(*markers) * markers_cnt);
> >
> >         output_label("kallsyms_names");
> > @@ -476,14 +478,14 @@ static void write_src(void)
> >                 }
> >
> >                 if (out_bin_file) {
> > -                       if ((i & 0xFF) =3D=3D 0)
> > -                               markers[i >> 8] =3D big_endian ? htobe3=
2(off) : htole32(off);
> > +                       if ((i & ((1u << marker_shift) - 1)) =3D=3D 0)
> > +                               markers[i >> marker_shift] =3D big_endi=
an ? htobe32(off) : htole32(off);
> >
> >                         fwrite(len, 1, len_len, out_bin_file);
> >                         fwrite(se->sym, 1, se->len, out_bin_file);
> >                 } else {
> > -                       if ((i & 0xFF) =3D=3D 0)
> > -                               markers[i >> 8] =3D off;
> > +                       if ((i & ((1u << marker_shift) - 1)) =3D=3D 0)
> > +                               markers[i >> marker_shift] =3D off;
> >
> >                         printf("\t/* n:%u */\t.byte\t%u", off, len[0]);
> >                         if (len_len =3D=3D 2)
> > @@ -504,6 +506,10 @@ static void write_src(void)
> >         printf(".size kallsyms_names, . - kallsyms_names\n");
> >         printf("\n");
> >
> > +       output_label("kallsyms_marker_shift");
> > +       printf("\t.long\t%lu\n" , marker_shift);
> > +       printf("\n");
> > +
> >         output_label("kallsyms_markers");
> >         if (out_bin_file) {
> >                 write_incbin_header("markers", &bin_offset);
> > @@ -926,6 +932,7 @@ static void usage(void)
> >                 "Usage: kallsyms [options] [vmlinux [out.bin]] > out.S\=
n"
> >                 "       kallsyms --sysmap vmlinux > out.map\n"
> >                 "           --all-symbols     Include all local symbols=
\n"
> > +               "           --marker-shift=3Dn  Interval between makers=
 (6 =3D> 64, 8 =3D> 256)\n"
> >                 "           --pc-relative     Output symbol offsets\n"
> >                 "           --sysmap=3Dout.map  Text map file\n"
> >                 "           --verbose         Extra diagnostic output\n"
> > @@ -946,21 +953,33 @@ int main(int argc, char **argv)
> >
> >         while (1) {
> >                 static const struct option long_options[] =3D {
> > -                       {"all-symbols",     no_argument, &all_symbols, =
    1},
> > -                       {"pc-relative",     no_argument, &pc_relative, =
    1},
> > -                       {"sysmap",    optional_argument, NULL,         =
  's'},
> > -                       {"verbose",         no_argument, &verbose,     =
    1},
> > +                       {"all-symbols",        no_argument, &all_symbol=
s,     1},
> > +                       {"marker-shift", required_argument, NULL,      =
     'm'},
> > +                       {"pc-relative",        no_argument, &pc_relativ=
e,     1},
> > +                       {"sysmap",       optional_argument, NULL,      =
     's'},
> > +                       {"verbose",            no_argument, &verbose,  =
       1},
> >                         {},
> >                 };
> >
> > -               int c =3D getopt_long(argc, argv, "", long_options, NUL=
L);
> > -
> > -               if (c =3D=3D -1)
> > +               switch (getopt_long(argc, argv, "", long_options, NULL)=
) {
> > +               case -1:
> >                         break;
> > -               if (c =3D=3D 's')
> > +               case 0:
> > +                       continue;
> > +               case 'm':
> > +                       if (!optarg[0])
> > +                               continue;
> > +                       marker_shift =3D strtoul(optarg, NULL, 10);
> > +                       if (marker_shift > 24)
> > +                               usage();
> > +                       continue;
> > +               case 's':
> >                         sysmap =3D optarg ?: "";
> > -               else if (c !=3D 0)
> > +                       continue;
> > +               default:
> >                         usage();
> > +               }
> > +               break;
> >         }
> >
> >         stamp(NULL);
> > diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> > index 44b5a6d78ce5..61cf8f287ebe 100755
> > --- a/scripts/link-vmlinux.sh
> > +++ b/scripts/link-vmlinux.sh
> > @@ -37,6 +37,10 @@ is_enabled() {
> >         grep -q "^$1=3Dy" include/config/auto.conf
> >  }
> >
> > +value() {
> > +       sed -n "/^$1=3D/{s///;p;q}" include/config/auto.conf
> > +}
> > +
> >  # Nice output in kbuild format
> >  # Will be suppressed by "make -s"
> >  info()
> > @@ -140,6 +144,8 @@ kallsyms()
> >                 kallsymopt=3D"${kallsymopt} --pc-relative"
> >         fi
> >
> > +       kallsymopt=3D"${kallsymopt} --marker-shift=3D$(value CONFIG_KAL=
LSYMS_MARKER_SHIFT)"
> > +
> >         info KSYMS "${2}.S"
> >         scripts/kallsyms ${kallsymopt} ${1:+"${1}" "${2}.bin"} > "${2}.=
S"
> >
> > --
> > 2.39.5
> > =20

