Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE04A42E40A
	for <linux-kbuild@vger.kernel.org>; Mon, 24 Aug 2026 13:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787579259; cv=none; b=GNhh28Sb8Z3HdGdHeIuA7zSbK6BMCjewFD277mXtrCytkRcf7y8LIt+8PB0OZEKHFJYVR4c56LEMWFxL2ziuCsvKzhFe16ODN60PkoA6T9TCNGQfHfHM4bXGmUvLBc9/wcJ3IjrrxIkul8ner+unCPtmZIvzGitufloz6jmJ+Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787579259; c=relaxed/simple;
	bh=3F0jiyVTanJ+AsVc8N4FH60Qj2BcH8oGf1xExaoOipk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MTECy/sy+2YQLSVTLHVhlXVfXEDXAJGlrODR5b12zs8Cmb4+DEfcy6awlmK1ahZX1ldiJ7nFdIkWT7dUKsxyDKoy6g8xU+EIeXZAVI1alRhBtCn5X5ISEGPk1AS5L8fmYd6Wt24JgCBSHEmlUxSoHsBW0vqPvIGIH28LPcQE2D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-977ba4d3b49so2562657241.1
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Aug 2026 06:47:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787579252; x=1788184052;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kyiJvlEUTZbfecKHieUj9osiaGG9GPJvuGru3ySDu2k=;
        b=VVONLR7d1WXa56oR3NRuxzQMCa8ngTtrPDP3hdQOHHCMJ8XhjchKvkoWys7ZnVaZaj
         joUQlI4juOMoHYOiQvOAmvpVhyq7HrlHniQoEoGi+KVky+G4ORkujSlg5eaxta75d78f
         WTPX+DzROT6F1xaxK7IWZgionAtW2t1sBb/+y1yrbK4jL0AdRsvAy8kdnhNYli4kpZGl
         QPTDJTqVZHOnlQ4hmTPk5KXUJhPANpZz755cI65JYykHUbhGNVzXZZ9+JhI6VrI5YGbi
         +yKxHeLZA96LVYXTwri8VElceS4b9FYw1zPg2V8yaiebk5EiUcX1XTI9wIXC2xAAN+Ib
         2Kyw==
X-Forwarded-Encrypted: i=1; AHgh+RpT5CsT38R1xVu+15kAy6JQQUkRbFwsAU3z3XXlpif/UdFZkK1MbjruLezZw5KDDiiG4d5dpjyxi957tgM=@vger.kernel.org
X-Gm-Message-State: AFuF++mlNIfqqKzptxGjiJHczUiJVLcnZyslhU+RwdsJEiUHihdcA3F3
	CNUHByMhyHBcPEf/7RyD/ZFN0ZqH5RUHpWfDA7mpJlkqcDnGJG4V60DjlYkduZNJ
X-Gm-Gg: AR+sD11zBMzsdtqaxHDFP0v0A/jiQSdzMEuBeTF2nnkaGZht1QOO3V2AlQCWNTFV/5F
	6rtJIMepPoObBScn6CtzJv3HcdGWBKIiLhbHSU5Blx5bouHWGS2/wunoDW26Qb1a4tiMTxFeBoE
	cSAeWQitGAnvBQZOaPJ4nwcm5pLIUKYSQPmUGDrDdYZOK5LvZex0sL4F08+MS1zjJbHp9Wc9MlP
	CcoGghGc9AUbgRicddp3+MzyT51hcbWA23MhCnWU2w/c1AIRLFY+7KzVYqLFM/IHC9dHLi7fG3O
	0kZLW1Gt5J8n3OXPkmZGK3vVzgI0g8+4PXrVGc8dQzAt1/DFUpur9DwN6trt0ibCIg8gfpndUow
	jsSG8lIQ22obksKgGpEfwDAuLtudLZF6roDEL/5Ef/NhgyFuVJE2lVIkQhEtAR9xV8QVfOf2SMk
	kNS0xONKP7Hal5bQsDd+SsgC6IhXXGli5mxE/efDJD8VXjvyfhV2X3s1kedb2xB0Jz/Lg34xt0G
	CEjIAEkLyI8ZpIJzv4D5xmwasBtOK7NHOyjOrgPfA==
X-Received: by 2002:a05:6102:6e59:b0:777:2e1b:1e2e with SMTP id ada2fe7eead31-778f05b86f7mr6431463137.3.1787579251869;
        Mon, 24 Aug 2026 06:47:31 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97c832ab30asm7447619241.0.2026.08.24.06.47.31
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 06:47:31 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-75609e844faso2507870137.0
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Aug 2026 06:47:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq/el/fJL2iYVtYcb3/aSNHEsi+SN5Uqu+3C7F1uz5VGsar5NlD82+4vWNRdn28XzT0Mc+gACMkO1xV9G8=@vger.kernel.org
X-Received: by 2002:a05:6102:244d:b0:6cb:b3db:c31c with SMTP id
 ada2fe7eead31-778ed3945cfmr5933099137.0.1787579250924; Mon, 24 Aug 2026
 06:47:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728-linux-kallsyms-fix-v1-0-1a665156c898@linaro.org>
 <20260728-linux-kallsyms-fix-v1-1-1a665156c898@linaro.org>
 <CAMuHMdWEzs=+vuV0oX+v2WVukHNg+o5FspczHyZggY4ADHJKqA@mail.gmail.com> <73b681a103cecd66fe122cc225b08d529c2ed56d.camel@linaro.org>
In-Reply-To: <73b681a103cecd66fe122cc225b08d529c2ed56d.camel@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Aug 2026 15:47:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX=1ZPjBHh7bQyC_EEU47vLERf24U7vc9u5PgGZ4D8ULQ@mail.gmail.com>
X-Gm-Features: AcwNN1VyUy0M0rGPTbXT4r_algKfQ0yEW9eWKMfCEiPXt7KPRsCwaHn3b9bdeoM
Message-ID: <CAMuHMdX=1ZPjBHh7bQyC_EEU47vLERf24U7vc9u5PgGZ4D8ULQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kallsyms: add symbol size for kallsyms symbols that
 can change size
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
	Guenter Roeck <linux@roeck-us.net>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Mon, 24 Aug 2026 at 15:35, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
> On Mon, 2026-08-24 at 14:26 +0200, Geert Uytterhoeven wrote:
> > On Tue, 28 Jul 2026 at 14:52, Andr=C3=A9 Draszik <andre.draszik@linaro.=
org> wrote:
> > > Add symbol size for kallsyms symbols that can change size so that siz=
es
> > > can be determined easily without having to manually calculate them
> > > when inspecting the object files (.tmp_vmlinux?.kallsyms.o or
> > > .tmp_vmlinux?). Without, the assembler records the symbol size as 0.
> > >
> > > This is primarily useful as a debugging aid in case of linker errors =
as
> > > part of link-vmlinux.sh, and because symbol size doesn't have to alig=
n
> > > with the offset to the next symbol due to padding/alignment.
> > >
> > > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> >
> > Thanks for your patch, which is now commit d6bf11a7e8a86135 ("kallsyms:
> > add symbol size for kallsyms symbols that can change size") upstream.
> >
> > FTR, this commit has a huge impact on kernel size, according to
> > bloat-o-meter:
> >
> >     $ bloat-o-meter vmlinux.{old,}
> >     add/remove: 4/0 grow/shrink: 0/0 up/down: 440264/0 (440264)
> >     Function                                     old     new   delta
> >     kallsyms_names                                 -  324543 +324543
> >     kallsyms_offsets                               -  114424 +114424
> >     kallsyms_token_table                           -     849    +849
> >     kallsyms_markers                               -     448    +448
> >     Total: Before=3D5085496, After=3D5525760, chg +8.66%
>
> I suppose the reason is that before the patch each of the above 4
> symbols' size was recorded as 0 in the ELF file by the assembler.
>
> With this patch, the assembler places the actual size for each
> symbol. Hence they appear to have grown, but in reality they
> haven't.
>
> Looking at the delta between each of the symbol's start address with
> and without the patch should confirm that, too.

Correct:

$ diff <(nm -S vmlinux.old | sort ) <(nm -S vmlinux | sort)
--- /dev/fd/63 2026-08-24 15:46:29.404049009 +0200
+++ /dev/fd/62 2026-08-24 15:46:29.404049009 +0200
@@ -34748,11 +34748,11 @@
 0045884a 000000c8 d decpair
 00458912 000000c7 D linux_banner
 004589dc D kallsyms_num_syms
-004589e0 D kallsyms_names
-004a7da0 D kallsyms_markers
-004a7f60 D kallsyms_token_table
+004589e0 0004f3bf D kallsyms_names
+004a7da0 000001c0 D kallsyms_markers
+004a7f60 00000351 D kallsyms_token_table
 004a82b4 D kallsyms_token_index
-004a84b4 D kallsyms_offsets
+004a84b4 0001bef8 D kallsyms_offsets
 004c43ac D kallsyms_seqs_of_names
 00520100 00000070 D stop_sched_class
 00520100 D __sched_class_highest

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
