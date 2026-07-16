Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A403F88AA
	for <linux-kbuild@vger.kernel.org>; Thu, 16 Jul 2026 10:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784197454; cv=none; b=N3VqafF0t1qRwadkq7kqeBOR8EV1y7UCXS6OghyuUJmnex2/oD/dBLX11gMcxtvtVNSp2g2LBKfgCBkanVfeRmv3bUEtl453xuYR4rmalD1Kt+z8MS6MXz58g/jX45zZZopUbqYXtHxEC2i/65MQznBPW+FiQvBFLKfVru8Tdk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784197454; c=relaxed/simple;
	bh=H96f0Y+mS9UUui50OTwp+FS78GxH4OI8+qAykHCapSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ulK7hHvExKtBmMGIPNTBPKrlYPmOKuhSsFdPqTbzhw8z2G2otDKJJ8q/jMT3GOI4wvcOrQPEVcsi1yQlJTLFSZ7Tw/nEUs2stnW73ro1nnGaLDM6ZIgU/7lfL18E2ASEB9tFfzXLG6oocve2IFgLpfQe2iLv1jM64vTA6JlQq6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MEl72pts; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=A7Ohn6sf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MEl72pts";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="A7Ohn6sf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784197452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=50cI7ieNmIHPd4mhSZFI65e7NDu6vdoL36/tOZCxW4g=;
	b=MEl72ptstK+W7k0bkaTlu/GNbXDHJfmL0z37NDWSwTNzXU/45E2KmQYbkYztEDusNhOPZF
	B7WJ1jaJcvlZJdFt4l9sdRt4nzhwG+PhIJP3c04hIfNdvFho7RHAIIliwUmwi/AUPCb+dt
	jtgsGV5nRRhVGKYzLkG2xkvkSjAYklA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-ffMAUsurP6i9dIJcfUG4og-1; Thu, 16 Jul 2026 06:24:10 -0400
X-MC-Unique: ffMAUsurP6i9dIJcfUG4og-1
X-Mimecast-MFC-AGG-ID: ffMAUsurP6i9dIJcfUG4og_1784197450
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-475e540a0ffso3759663f8f.3
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Jul 2026 03:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784197450; x=1784802250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=50cI7ieNmIHPd4mhSZFI65e7NDu6vdoL36/tOZCxW4g=;
        b=A7Ohn6sfU7yyFfZbsMelbQci8arx0xvMWWJ/og3B4/kA4m+57aFpuk3U15Iio9N6Bx
         sO65nKzDWpWBifcS6wtqgol+QWxHocU28sh4cBjJNtbZ0t84X2T0UAnXNzesR6rZyXDK
         nxCCCDr2XSNaJvipQbBEGIQilHV8iDBJ46PKObD6J9Bz+6fGrqUKD3yoT3rq2xLppXbf
         jjvLqHdYYhv0Io/hJLcGKhpVqLtDK25u6b9zogEpmbZkIk9XGQ+DwHrS0vDuxpSGyoxZ
         mxKiCHE+8MwbYe4GPY+s44meccCf72RnPKDNJX5c4WSEBij8IcGHw4ch85Jo7e8NuRqq
         qebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784197450; x=1784802250;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=50cI7ieNmIHPd4mhSZFI65e7NDu6vdoL36/tOZCxW4g=;
        b=cknXfAYaIvf/uMWH/USRxQLkUoLn28ARw65TfhUYT6s2/wiGoqAMHWz2t61si9Vi63
         Ck/fFJGchXB3M3avNr3SMwv05qr8S/yOzyOx+TgC7l0dwseuZZGSdgNxwRB+CBIljVBt
         2glwnqh14qVJZ99hfIggfP9e4YEpESwsDaigAICegFdehhpITAe9pacGTbIp3XYMSq9e
         BFydyrThmfWgfWfeoZBcmwzJLxtU44MtjlVvk4vbw6MCBUW62ARwXXujX8/Oj2Y24Lwd
         xWTj1Enoh5KBaHdKl/N90a3T/bol43btjmydRxFNnCjQI1NPh8XvIH/wih7r/0OSV2B8
         Z1YA==
X-Forwarded-Encrypted: i=1; AHgh+Rra0gvLuWG410fcRj4Ye/BJE+Y7XPfco5/53DJIRnhgP9LVDdjjPB4ri1utKOPs2ksr9JVMKM5cTTleEcM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOz/lJTZr/fcKH9fOxONGVcBGjy0H/4RfBZvLJ65Fp+EWcpFYh
	hpiq9oKfoacGHRcYxo/WsklXErWm4/A8VUfPrTj2QHVYGxUcNQWgmPtN7cV4i6l8XlmIV3kyD+3
	T3ut2x8gJSYjBrZlKihunVl8a+WbWh2toTEDor34QQ3GK1Oa8omyFZDfx0Z/NDhEB2uOBjw+Ixg
	==
X-Gm-Gg: AfdE7clf86MBrOFFxAcfLb9heCb250O92rirHW0LUblc5mTggP94SWawg2SUW5NVtu+
	nUS2k1ambehslQZP8xQDeRiAtSwwGz0cG8KSy/buQzb+8Nu1AH65YENhUSHFhdKMW/5IuKGW3y5
	ys7nVN2YFP5DNwTP50bwunaVYj+pFHO15ytPOzaTB7WebwU8YrndVMcd6h0KzthvTgACCEDtOIv
	MtlvnzBHycc6+opKQcdyKeNp4WCCWf9w8TadmM7oxV+Eg2A6ySF500fyUV+eeV4ERlgz+PhTtuC
	DK95YqL/KiNdp/Xcj55OpDzposDuQPOOPmpwnzZ0G/iuf0rHgpkGp5IJ9X7eRH1AFofC1jqzBw=
	=
X-Received: by 2002:a05:6000:4914:b0:473:1706:7f01 with SMTP id ffacd0b85a97d-47f488bf7bamr11830586f8f.43.1784197449701;
        Thu, 16 Jul 2026 03:24:09 -0700 (PDT)
X-Received: by 2002:a05:6000:4914:b0:473:1706:7f01 with SMTP id ffacd0b85a97d-47f488bf7bamr11830556f8f.43.1784197449289;
        Thu, 16 Jul 2026 03:24:09 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.112.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a9cesm23718289f8f.14.2026.07.16.03.24.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 03:24:08 -0700 (PDT)
Message-ID: <823e3bf3-ef3d-47cf-aff8-1668875a2f38@redhat.com>
Date: Thu, 16 Jul 2026 12:24:07 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scripts: headers_install.sh: Normalize __ASSEMBLY__ to
 __ASSEMBLER__
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Nick Huang <sef1548@gmail.com>,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20260309-uapi-assembly-v1-1-a7ebfbf14309@weissschuh.net>
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20260309-uapi-assembly-v1-1-a7ebfbf14309@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/03/2026 16.58, Thomas Weißschuh wrote:
> There is an ongoing effort to replace the usage of __ASSEMBLER__ with
> __ASSEMBLY__ throughout the kernel tree, see for example
> commit 287d163322b7 ("arm64: Replace __ASSEMBLY__ with __ASSEMBLER__ in
> non-uapi headers"). The latter is automatically provided by all compilers
> and preprocessors supported by the kernel, so the explicit definitions
> of __ASSEMBLER__ can be removed.
> 
> However the UAPI headers might be used with older (< GCC 3.0) or
> non-GCC-compatible compilers, which do not define __ASSEMBLY__
> automatically.

  Hi!

I just had a try with gcc 2.95.4 from a Debian Woody installation, and it 
defines __ASSEMBLER__ automatically when compiling *.S files, i.e. gcc 2.95 
does not seem to be a problem. So can you point me to a real case where 
someone tried to use a user space compiler where __ASSEMBLER__ was not 
defined automatically? Otherwise, I think this patch could be reverted again.

  Thanks,
   Thomas

> So this migration may brake users.
> Also during the migration phase, the UAPI headers will use a mix of
> *both* __ASSEMBLY__ and __ASSEMBLER__ at the same time, which is ugly.
> 
> For now make sure that the exported UAPI headers consistently use
> __ASSEMBLER__ as before.
> 
> Link: https://lore.kernel.org/lkml/164baf81-2824-4943-bbc1-4ae8a160c0cc@t-8ch.de/
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
> This should go either through kbuild or asm-generic, I think.
> ---
>   scripts/headers_install.sh | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
> index 9c15e748761c..2f1d1767ca26 100755
> --- a/scripts/headers_install.sh
> +++ b/scripts/headers_install.sh
> @@ -36,6 +36,7 @@ sed -E -e '
>   	s/(^|[^a-zA-Z0-9])__packed([^a-zA-Z0-9_]|$)/\1__attribute__((packed))\2/g
>   	s/(^|[[:space:](])(inline|asm|volatile)([[:space:](]|$)/\1__\2__\3/g
>   	s@#(ifndef|define|endif[[:space:]]*/[*])[[:space:]]*_UAPI@#\1 @
> +	s/__ASSEMBLY__/__ASSEMBLER__/g
>   ' $INFILE > $TMPFILE || exit 1
>   
>   scripts/unifdef -U__KERNEL__ -D__EXPORTED_HEADERS__ $TMPFILE > $OUTFILE

