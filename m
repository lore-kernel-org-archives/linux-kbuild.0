Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794666589;
	b=EWuVQvFEJ9pJsT56jbvY8uR/D0GIJQQCQ9DVZZUeg6c4Ul6QorR+ZNwR1Ez4Yk+1rHxS
	 ysJHpHnYr9LN2ziZ0/r4JVi5gI1DLCTTPf1Q3R/hsRu3Y/liz+A7Zanr+ywyFQge/Q+6N
	 5gjSJeUsil0n6QTO/o9soEM9Y1JDGTYwXkUWzfyolU1/+3Nf03oaXYislIsQSfaq2CNj4
	 qh8Lh9VYLhLeYfKoff4OJ5iandQzpmJWBY3H54yLcjsgBxGQkIiLoCo5ex7hGIMcyj07A
	 mS0ShfX0n8fVwwVb4xMFojz9bboBuY4wBW0RrGtv/5dOt1bNgP7WyoFYtmqPpLQO5XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794666589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=f7HvEUVX2tM63yR8jJepOym4Rh82WzMm5BKq2XP3tdo=;
	b=p95Bk4kmSikAb10GjJr7GgOpddoCn6ImZfsF/qOpWIUT4ytDGWaer292QOqnEXiN4Qcg
	 HnNf66Kkdrnh3SgixHqjNiGVOGU/cTNyv7MhYKAnVbm+EqxHrsgNTpdTkXHByx9GY2Zkb
	 ijZ+mINteLKgBrn3lxT46PKYM+JgmRa2W4WGrC6U3V8qpKmyh9np8baOwK+0nhsFgBsb8
	 Q5Y/BoszxBXxsfz6CbaGohlrGTKe8kQI9twTt2EM9I0lbJq4GPl65g030+ekF2oqdnMme
	 fOsV+cETsLyeyK1ZEAz3KZW7HgEF0j39YUKRuXzJm9mcXHpwqYOJjU24LYybN0IcwLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HpXUScZA;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F73606A33B
	for <linux-kbuild@vger.kernel.org>; Sat, 14 Nov 2026 14:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54F73606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HpXUScZA
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so24300395e9.2
        for <linux-kbuild@vger.kernel.org>; Sat, 14 Nov 2026 06:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794666588; x=1795271388; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f7HvEUVX2tM63yR8jJepOym4Rh82WzMm5BKq2XP3tdo=;
        b=HpXUScZACECxG4WhYK9jGinw4ofm8bkHLlHgC0rBsHtIayapJcUt8XtJ9A4FyTa+0R
         b11ZZl2iA9Rt1NDyvpXbeIbx/vRd5ZvFj5w1jFmYZeMLRs9m5fVvDbY3vrjzhSfID396
         mOAkiNkyBVDYGyFsa/NpUbcwMPhaFxsa1fLW7EweVi5rQKuP7G4cM2ZTXVJdeTpTeBAD
         SRDgnS8P+coEsSP/TyqY71F+vuh57tkCCTVD0a4jCahViewn6GustfvWM28hVIWR8R2j
         nj0/m6qQQ/P474IGCzI1zcrvTFZEhdaRMpal5S55MO7kkJ3J/gu/oezSqKL6jJNz3bHr
         Chnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794666588; x=1795271388;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f7HvEUVX2tM63yR8jJepOym4Rh82WzMm5BKq2XP3tdo=;
        b=syc42Apv0IJ7LLG/l+hOVK74MRw4xj70G4hsfoUxPixFNfy3obmFCFPy9K4cxcOySA
         88ZoQQ50bfVBcXGhTwOiURhu93rYo26CaMH7USA3cS4F3EcosyRWPxTi36o72kN1zSYX
         y6hNCg8Z3HYbPWHQ3wzMTcpUqJRNScq4xtZ2/WdyxSVf1WHVVdgwsrDn05biCkXl1x5K
         JYGlEokdNZcl80z+GtOddAM+FbDQQRATp8vl4R8IguR/lXeopR4ndu/en9TIzFqnbQOF
         4lgV1z3i+uppKxCAAzlPEjA8166Xffqb7vvb3UcMckgMQY3TLtJxz4ZjTnFCYN5F3lyQ
         8pDw==
X-Forwarded-Encrypted: i=1; AL+hErG17gt7uieAcSzms/h7HHWMY+XYwZBtkyMMYuXDUjDg2GFj8sHbBjnc1G+iSG/V4d+8m7stMve74g45TYM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nbB04qt2zfir5E8d1q94f0LY7fNlWB9ROZ6olhDB5wq48gM+3
	/chLx8WStbNFVNEdxxhcibA2pvqx6GWqK8QQxobCNPdX4pPpcB0CgmV8
X-Gm-Gg: AYBFou2nKfc/EOQCkLT8hMJCX5jBznMzYySEU9zHCe9zwXKWw8c6uLNLye7/bF+vPSl
	q0RCM4tqblXL25IuUwdA7+wHovE87ZS4/fmQwC3dx5tHRsWEI+lQ5KzSUG+D42MYs53TAH2PrvE
	Ek2OoK7iZBqX90m4P8GEMOheSGHoWclr/ZOS9Wh5gktKv7vsZbWI9M86rFRNjzBJGTT2oUoUgM9
	4M4ii86HRRDKbqM0PzHNhP0GZqgEZFfM84eR4mBk2lsNoN3RxLAQkYZOLZZhqn+RLZPCKIZLPBm
	9BBLwaXWMEdVAErUfueNWx0PB6yeWUshZzLk0QA0o6Hs0QN28G21rP2IQmrZzYiRIBJs8KfQVUe
	dWaQi4weMwrd6qIw5+x+6evqpv/4bmXuD4ZhCud6TUPSTWHvxfMtKX+dkW0wh62GqvXQu32WFKe
	4/wJk/oQTMhBpUFlg1H3ZEr00dsG5umBmx2htYtvWve5MNJTQ9oJ7nnHxSdYAt06jedmnGpPcQU
	1GLnWvMUKF14n/RWK8l2HqrVLfdNtnhwOwKNfQxcDczi7IukqD4PBtrWFXR/0scsmRO+GaqhXrh
	jiVDUF3J/VOdmvWh9PO6/xJEVLHoCxGTO7fGQydyJUi4i3tH46JlRlzXbvvtv5swLw==
X-Received: by 2002:a05:600c:a0b:b0:4bb:685e:cc41 with SMTP id 5b1f17b1804b1-4bb685eccc8mr17988175e9.8.1794666587612;
        Sat, 14 Nov 2026 06:29:47 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb56f8d054sm92922965e9.3.2026.11.14.06.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:29:47 -0800 (PST)
Date: Sat, 14 Nov 2026 14:29:46 +0000
From: David Laight <david.laight.linux@gmail.com>
To: bot+bpf-ci@kernel.org
Cc: pmladek@suse.com, kees@kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, bpf@vger.kernel.org, jim.cromie@gmail.com,
 ljs@kernel.org, mcgrof@kernel.org, andrey.grodzovsky@crowdstrike.com,
 rostedt@goodmis.org, andrii@kernel.org, wusamuel@google.com,
 linux-kselftest@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net,
 martin.lau@kernel.org, eddyz87@gmail.com, yonghong.song@linux.dev,
 mason@kernel.org, ihor.solodrai@linux.dev
Subject: Re: [PATCH v3 next 02/13] scripts/kallsyms: Improve error reporting
Message-ID: <20261114142946.4d696bc5@pumpkin>
In-Reply-To: <8c6f9e7d8a4cb037b480c22ba2b6866133292bbd68ebdc777e385373950b793f@mail.kernel.org>
References: <20261111115911.1142000-3-david.laight.linux@gmail.com>
	<8c6f9e7d8a4cb037b480c22ba2b6866133292bbd68ebdc777e385373950b793f@mail.kernel.org>
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Nov 2026 23:33:55 +0000 (UTC)
bot+bpf-ci@kernel.org wrote:

> > scripts/kallsyms: Improve error reporting  
> 
> TL;DR:
> - Error message for failing to open the output file says "nin.out", likely a
>   typo for "out.bin"

Indeed - will fix (and in #4)

> - usage() text for --all-symbols may be inaccurate: it covers all sections,
>   not just local symbols

It'll do - needs to be terse and it's a build tool.

David

> 
> > diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> > --- a/scripts/kallsyms.c
> > +++ b/scripts/kallsyms.c  
> 
> [ ... ]
> 
> > @@ -822,6 +824,25 @@ static void sort_symbols(void)
> >  	qsort(table, table_cnt, sizeof(table[0]), compare_symbols);
> >  }
> >  
> > +static void usage(void)
> > +{
> > +	fprintf(stderr,
> > +		"Usage: kallsyms [options] vmlinux out.bin > out.S\n"
> > +		"       kallsyms --sysmap=out.map vmlinux\n"
> > +		"           --all-symbols     Include all local symbols\n"  
> 
> This isn't a bug, but is this description of --all-symbols accurate?
> 
> In symbol_valid() the option only disables the text range filter:
> 
>     if (!all_symbols) {
>         ...
>         if (symbol_in_range(s, text_ranges,
>                             ARRAY_SIZE(text_ranges)) == 0)
>             return 0;
> 
> so symbols from the data, rodata and bss sections are included, global and
> local alike.  Local text symbols are already kept without the option.  This
> also matches the CONFIG_KALLSYMS_ALL help text, "symbols from all sections".
> 
> Would something like "Include symbols from all sections, not only text" be
> closer to what the code does?
> 
> [ ... ]
> 
> > @@ -845,49 +867,57 @@ int main(int argc, char **argv)  
> [ ... ]
> >  	out_bin_name = argv[optind + 1];
> >  	out_bin_file = fopen(out_bin_name, "w");
> > -	if (!out_bin_file) {
> > -		perror(out_bin_name);
> > -		exit(EXIT_FAILURE);
> > -	}
> > +	if (!out_bin_file)
> > +		err(EXIT_FAILURE, "failed to open nin.out file %s", out_bin_name);  
> 
> Is "nin.out" a typo here?  usage() and the close-time message in main(),
> 
>     errx(EXIT_FAILURE, "error writing out.bin file %s", out_bin_name);
> 
> both call this file "out.bin".
> 
> The string is changed later in the series by 317dc01f3774 ("scripts/kallsyms:
> make use of binary data output optional") to "failed to open bin.out file
> %s", which still differs from the "out.bin" used by usage() and the
> close-time message.
> 
> 
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/43116767394

