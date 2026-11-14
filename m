Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794666735;
	b=I1kbPwLr1vrnobu5P+CXXBal8ZG5uY1+zJ7HyYKpiRGjLDWegyhmjj6bknrtJcZjDEZS
	 +G/LjZc6tn4/y97SM7WPrMUsZoTQPAK8ujIXc6Hg6+ybpCWYWYPra6rR04Vd6hTErP9D7
	 HlmQ3vsDNsWfQWEeYwOb9Ds0tS5ymk54ZLm3DzxTFwz7t8b+y/CB1AV2OnBEegUSmsu1k
	 CWZ7inE7XfngopByhTYWyxujDzWEe8aovksNX3hxa53O/tkYIjt5ynJ76nnTsTlR6peaj
	 Ia8K5o7RborCrH60OdWZgADv0Ii/DvfZ17/4ZBsjV4NgSOVmuqBgthuiEUfFkTdfMjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794666735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=qWeCdWju2mIKB8UGaY5EcBwHtnHoPxgSD81CkBCW95g=;
	b=P1jIpnajO4eCVy6OjQbWqdCBTc6LwwmOkTBekBbmoPMV85i1f/6gadXz4UDqtmAFJ48J
	 yP54Bqq6drCZB6phqLNajFssliC2306Z2/G9sN+iq4a0VjhtIm4WtagcqR44ftvgaOBYo
	 Cmg059l9Rf+N8fUKaJosmfuaLSu8V7F3eOy0zaXSex9Xor7F3nVGAOi5aoECzbG8wk44M
	 c3Ixkm1ENllPwaoKDcSPRRvBZbcKPXUdh6tCbelGWMLEjITAzNgP4HpAt3SQXZSLZM1Xj
	 EFoY8WfAzAskOkAWStuiQS6DNsMEMV5zOxvEUxRF9XXNMA1zFZi3YLGGjZCUKyIJuXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l4uwH9W+;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC9C606A32E
	for <linux-kbuild@vger.kernel.org>; Sat, 14 Nov 2026 14:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBC9C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l4uwH9W+
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a214af2076so12200915e9.0
        for <linux-kbuild@vger.kernel.org>; Sat, 14 Nov 2026 06:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794666733; x=1795271533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qWeCdWju2mIKB8UGaY5EcBwHtnHoPxgSD81CkBCW95g=;
        b=l4uwH9W+LongKMjKUPj5DXIOjleJ2mm4NAm1kSaMM6/9KiDRosdmoAXy0LMFRC/TAF
         MpOGY+/UwXVfZeKN4RxiXflwYRTCKdbtMjBqJ2SZ/sENJMariHaUEJUoOeIyFcdtxAGu
         u7Dr3YngPo3e7vKyZClqvWfsBsy6XYXoPwkryijjagUA+U3hgWhI6dc+xZSxPXW8r4qG
         70bYXCpcsbdvqJqkogb9egAWtDNaTH6d1bKxLnKzO7duUPl30s+fUwomjOqZ01rNSo4M
         xwvmOb5y5jl9RPL1c5AjYJbOYeXVM09JMwQRxkTRgeJOCly30U6uHLai6B94BiNTfAFF
         Hd5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794666733; x=1795271533;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qWeCdWju2mIKB8UGaY5EcBwHtnHoPxgSD81CkBCW95g=;
        b=YnGlosUgDvVsd8Ek57CZcWuAlmzqiJeQiSdHAu9aSJlZhzfSsqkQ1tBzjpdoj+PbLk
         3XQV0eq/Ap/0DX6N/4JrVFz9BuDSbbT50Ta4qHHrDeHY2sr8K/ADgAj7/WqKMF4iqNfg
         qyY+EQEDOJxTAV89dQKTs6xB+yapR2M9Gm8RloWpPgpmsV43XYx8NQwaNkqFg+VeaJ+F
         YTtjt9pen09erfH1iDfEQGoMC2nk+M8xQ8c4iavr+UpDQ3zDr9K9fIPKyy1AZKcYlmOm
         +qPRhM5WaIxUXjH2lIEJspbiAUst8qRu2BLaPW20Cjr4Nhkay8cFyDx9qrUXb59veZNC
         qfIw==
X-Forwarded-Encrypted: i=1; AL+hErHEK+3Ae74582OJ04Q/2TmesQPGbqxJAY+0fXXoHRsV8qYMQn3/yBSG+Hdy6Hsjyx4WAuO9nb5pOCak760=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TrVSIbgPtIAF2AhoGZQtiey42ZzvzUF/UCvndTjPOl96mF8fE
	fZ667/g4P6/P5Sur5omjjBQo0hrXhfGqGOGv/HwdWZ7RO7EbBpbSKxGj
X-Gm-Gg: AYBFou0eDhIENyK9aQQxlUasAMXb/ehVJK9lzS6RiAM5cafH6bCS/7ob1P4a1tzsjW7
	E7ruOfcO2agQ31qzo4siUc/nD/+A08O2rccMGn29qnHgWEU9KNJZjRHobgtycqa0O+TCE7nxI9o
	UwIo2a+Q50E7k2BaJn/7uCN1kT1YYPHlhf4DnmAL+5K//OJc4l9a9KslXWMwDotsfJypJvhu9Fo
	FcVeOYmBtbj8ywHHG2nzBrZ0yH2AgPpfNlrsNZpYIxQeDbzAs/UsrM3lXoL1GLsVcxp/kTVE5r3
	VwFCQMDjT1G+/0I3udSIjtoy9uCSFgCKXCjt1Hdx4Kf+xXHEkkfUImOqYqVD4bDeAxjs34DRMVc
	aGjDuwQpbAX0snks89Qm4UZ7dFFE5vyfGEhEkrQbA7JNPZ2DC/8UziuSkBjptVVRXi8BC54pkFS
	quPvIzf1Vqms7BdDzDke9svAaWwuCZDSaNp/n2pr9/9n1JNfXIz0ciqyk+nzX1kAvvW+S+/sKw2
	1LVCwxmOsV8fy1p5AU8K0gCDAAfs/Zn98ae4n4MEr5ov/qFjDVPkFoBOPB2EyYwuEpPDgKEOkXM
	eXzJuLHBHf3pcjPeFMxf+PE4m7Mck2RXsIm67s971UzL/1rP+F5hES17aGPyYbuOPA==
X-Received: by 2002:a05:600c:2d2:b0:4af:c210:5b3f with SMTP id 5b1f17b1804b1-4bb55a63720mr87539035e9.24.1794666733074;
        Sat, 14 Nov 2026 06:32:13 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb679b7e1asm56702255e9.6.2026.11.14.06.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:32:12 -0800 (PST)
Date: Sat, 14 Nov 2026 14:32:11 +0000
From: David Laight <david.laight.linux@gmail.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, "Petr Mladek" <pmladek@suse.com>, "Kees
 Cook" <kees@kernel.org>, linux-kbuild@vger.kernel.org, bpf@vger.kernel.org,
 "Jim Cromie" <jim.cromie@gmail.com>, "Lorenzo Stoakes" <ljs@kernel.org>,
 "Luis Chamberlain" <mcgrof@kernel.org>, "Andrey Grodzovsky"
 <andrey.grodzovsky@crowdstrike.com>, "Steven Rostedt"
 <rostedt@goodmis.org>, "Andrii Nakryiko" <andrii@kernel.org>, "Samuel Wu"
 <wusamuel@google.com>, nathan@kernel.org, nsc@kernel.org
Subject: Re: [PATCH v3 next 04/13] scripts/kallsyms: make use of binary data
 output optional
Message-ID: <20261114143211.753aaba7@pumpkin>
In-Reply-To: <sashiko-outbox-208980@kernel.org>
References: <20261111115911.1142000-1-david.laight.linux@gmail.com>
	<20261111115911.1142000-5-david.laight.linux@gmail.com>
	<sashiko-outbox-208980@kernel.org>
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

On Wed, 11 Nov 2026 12:32:07 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [Medium] scripts/kallsyms: wrong variable negated for negative offsets
>   in write_src()

Will fix in v4 - all the symbols offsets in my build are positive.

> - [Medium] scripts/kallsyms: 9-digit buffer in write_src() clobbers sign
>   on large offsets

I can't count! Only affects kernels that are larger that 1G.

> - [Low] scripts/kallsyms: missing endian.h include for htobe32() and
>   htole32()

Will change since v4 is needed,

David

> --
> 
> commit b5cbf4ceba792715bcee0dd6d58ce67f9542a5ad
> Author: David Laight <david.laight.linux@gmail.com>
> 
> scripts/kallsyms: make use of binary data output optional
> 
> This commit makes the binary output file and input ELF file optional in
> scripts/kallsyms, writes the markers table in target endianness when using
> binary output, and formats pc-relative offsets into a buffer for fwrite().
> 
> > diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> > index aa3a8ec83fbb8..74db751600b4f 100644
> > --- a/scripts/kallsyms.c
> > +++ b/scripts/kallsyms.c  
> [ ... ]
> > @@ -406,51 +417,105 @@ static void write_src(FILE *out_bin_file, const char *out_bin_name)  
> [ ... ]
> > +		if (out_bin_file) {
> > +			if ((i & 0xFF) == 0)
> > +				markers[i >> 8] = big_endian ? htobe32(off) : htole32(off);  
> 
> [Severity: Low]
> Does scripts/kallsyms.c need to include <endian.h> for htobe32() and
> htole32()?  Glibc pulls it in transitively through <stdlib.h>, but on
> musl libc hosts neither scripts/kallsyms.c nor its included headers
> declare these functions, breaking the host tool build.
> 
> [ ... ]
> 
> > @@ -458,31 +523,15 @@ static void write_src(FILE *out_bin_file, const char *out_bin_name)  
> [ ... ]
> >  	output_label("kallsyms_offsets");
> >  
> >  	for (i = 0; i < table_cnt; i++) {
> >  		if (pc_relative) {
> > +			/* All 64 bit builds and (at least) relocatable 32 bit ones */
> > +			static char line[] = "\t.long\t_text - . +123456789";
> > +			char *end = line + sizeof(line) - 1;
> >  			long long offset = table[i]->addr - _text;
> > +			int off32;
> >  
> >  			if (offset < INT_MIN || offset > INT_MAX) {
> >  				errx(EXIT_FAILURE, "kallsyms failure: "
> > @@ -490,12 +539,28 @@ static void write_src(FILE *out_bin_file, const char *out_bin_name)
> >  					table[i]->addr);
> >  				exit(EXIT_FAILURE);
> >  			}
> > -			printf("\t.long\t_text - . + (%d)\t/* %s */\n",
> > -			       (int)offset, table[i]->sym);
> > +
> > +			/* Build the line so the the faster fwrite() can be used */
> > +			*end-- = out_bin_file ? '\n' : '\t';
> > +			memset(end - 8, ' ', 8);
> > +			off32 = offset;
> > +			if (off32 < 0) {
> > +				end[-9] = '-';
> > +				offset = -off32;
> > +			} else {
> > +				end[-9] = '+';
> > +			}  
> 
> [Severity: Medium]
> Should this negate off32 (or an unsigned magnitude) instead of assigning
> -off32 back to offset?  Because offset is not used after this point,
> off32 stays negative when a symbol lies below _text, so off32 % 10 in the
> digit loop below yields negative remainders and writes non-digit ASCII
> characters into the assembly output (and -off32 overflows if off32 is
> INT_MIN).
> 
> > +			do
> > +				*end-- = '0' + off32 % 10;
> > +			while (off32 /= 10);  
> 
> [Severity: Medium]
> Can a 10-digit offset in [INT_MIN, INT_MAX] overwrite the '+' or '-' sign
> in line[]?  The template only reserves 9 digit slots after end[-9], so any
> symbol at least 1,000,000,000 bytes from _text runs 10 iterations of the
> loop and clobbers end[-9], emitting invalid assembly syntax.
> 

