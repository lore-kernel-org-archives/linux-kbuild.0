Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792593636;
	b=I1+AFj/RWdQxxjLbps4DhoB/nCszOn57re1DdLI7iCqwmSrDLOfyrUdH0GEVFXoAXa0b
	 qitXzCJ7M8mPKTToDgQUehp0Bl6t+b5dqR1cT+LRSZSGBKiidp5oscKGIForoxbROInv6
	 i0WlU85rhZC5BNjDzrDrOQgbhc3GMGqKXbKQ4YAo0+uI6dsHf7sJgkUOy40WuMCP5tmkh
	 YNXksr7ySQ0xMiIZbve3vWm96y4Pkryn1tzOiU58pJaEVvzX9zgXkoewZ6qlvTpc8XjES
	 xpPDt5EfWfQh4ArMr3v32niXEktlR5aQ7yu5PNfYuyz+Ug7A7yUaJilVwzUyk5GC9gw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792593636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0Gn2S/EOjHmywEEzdPOIvC1yoyDIbnmRdYYynFb0JCU=;
	b=TVVPIcKIXxA+mUzAY9u+1aKjW8z3aVmKQHzK0aKEeK8o2Ta/6NssCB+e2MG7x3VR6GYP
	 0ysg10JqlYAAtvbYQw9vLQrx/htzzwoUlbUa312iErWFE7y7cx9oEfmfe84gB0e+q/wFv
	 qnR9fmeIayVzhWz2N47LHaIta2TzCizaHAypxUNqInAvaNJvspKPWTfzsuYUXh/iGOXMf
	 /K295Tvq2cxSGfe4F27IplnIYnzpA/a+S32Co1bkQJdGi8W72+N9YOqaor3dAxckg2JGp
	 gD4n3tnFk9/Oj1Bz75YPyOSNJKYVifhqp8U58mGXH9ZFKj5B1YuN/zK/TSVbPrlUUKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YOtiR39o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C6B606A31B
	for <linux-kbuild@vger.kernel.org>; Wed, 21 Oct 2026 14:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95C6B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YOtiR39o
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c3fd91337baso110791866b.3
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Oct 2026 07:40:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792593634; cv=none;
        d=google.com; s=arc-20260327;
        b=lC1oXtX835eiNoMIm3f8esFRwFqDeLNnsHUPGPosBUl3UoDW214rR5hv4Sv1PDkhv+
         yqZpawvAZq28xYvZMctiLRrweqRkhrbW5ZckWAUVSrb9mT07EC+/d60pRV+8G9/VxpWE
         li3t1gEEGZz3GSA96hetibcHJ+Krt7a5IPv/YvJvzjVlgM0NO477LsUxBpcDvgdUB38x
         Qo3peU6oYPdKUoT0zevVVL2BcX7QnzzKTzDnQH2hZ3EYj9EW8uIH43OPcs0d65spcuT+
         z7PCBxlNK1ZdXnHEmLALAmiiRIb1QS0YVLqcR5J4HPnmEJ2CUQ+kzDvxhuFB0jK9+V9Z
         EpKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0Gn2S/EOjHmywEEzdPOIvC1yoyDIbnmRdYYynFb0JCU=;
        fh=Hh4cW8jlM2ZeOYHBol+3102+NlJQiKPkyx7ogwixzQ0=;
        b=YjhtwFD7vmV1URaBq+xyIJYKwHUFqVJFJCnWZhgiGyRTmLEagBlLlcI6yXCYeQFxFA
         9NEMeQy7cRw1oRntPq0C7KXcV06K5ikYZbdaqTX5lyz11urwd1jbKyWqhzmFVAyNm6+s
         RGi6zfcaVraRX4eqj3xb6EMh1EWJTOOJo1YCHDqsrvEQ7zWVVKkI/9Wic839hb9bw7vr
         OXVi97fMphK/rnjKDLAHmOqvUpB2HQ6LBvFvp6134iDWe7Em1HxUK7oVnhUHr8rXFYcx
         jN6EWHeHMxtn7wdMZxfvtcJ37Cva5tvc1dcvmF6isiVlEEAe4/p4rpDCMFsp5WUpeUom
         MzNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792593634; x=1793198434; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0Gn2S/EOjHmywEEzdPOIvC1yoyDIbnmRdYYynFb0JCU=;
        b=YOtiR39oWEq1NTpzYsD+O/moSozbEa3Eg4RSnKJy49DnFb+9W1tBNxOPOsrLRow/rt
         BKBrrgzC9CPN/ElxyNzs3dFY/pPyqRQE4CoqEPDfMQ8Ils4ANla9wilhdGn5zr2VUBsh
         XDClU5phi6C7HW5g7q4x4E+4fhhH+VQbFfTlKkYhue2wVkIqODpirKs7DYiD9NHgOAD1
         weJZNd0fgXEY46TQzfKEp2ZOQ9bKLcvHSgTAooQyE4W6vR0n3dycaUcgNAy5MwJJwboQ
         hopm5fU9nBm0YxyruqOpnDGw+OptacQuZQVNU+r0yL5AcOfOgY2vsxeMhNU33b82YSYu
         dbxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792593634; x=1793198434;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Gn2S/EOjHmywEEzdPOIvC1yoyDIbnmRdYYynFb0JCU=;
        b=EC+vCmPzOL8cbvavZPPO5S98J9blpim1p5HzY0ISTlWq6nHgQVQMAmPNSIDamca3ei
         YwztgTJiNJ+2yHJNPnpgwvLN+IyKAaFko/3nDNxJsT4XCrBV0Y+hhZcTIPySx/ljkxJI
         szvU+kj+Sw6rsXI+wCCK3ioV3NaUKo+oWRj2HKW5g40nNs2oqZpMylL85winw9cszzQm
         Exqh2hNt79XLeDh7UEVh7Gj8baJVoJwb9n/2wUjRfJLiXZUy7sfd8FHL4183q7k9G0Jx
         S+1LyJbultlIZJpwCn8aWWpV0//Xv5rE1bai7kAPFzLv8bl6OyOJNyaYQKF24EgS0HgS
         VWJA==
X-Forwarded-Encrypted: i=1; AKwUvBw3a4DN4QSiXM7ZG3KwppWm5oygMMCXG01WgYXZnDlHfwCn8hWdUeqkH7wbZSsRNya4X8vFupbpmcUfRDY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLR4VP4x1DlKb/jAYrJUSl+WFJQ0TC1kVwSAYFfwLT8Dl0584aQ
	bf38xYYhbiBuatdcgFbOQnAdkl3HZ7F8t+1c6N/1EzN2pJ5+x9Pp3mkv0dymQdxyzLhNas/nLiP
	Ngk3ycAj9T7jLSrAB2UOa5FM+JsHVE0ykxoM/lrw=
X-Gm-Gg: AYBFou2YfO1loWNEwH+GSvyKBq0kZUAmUsWivNnqyHU32VeQChpXNxXLpAtFPRHiyy3
	P2g5TUe3XZUABkQNPX/iHv50chNmeaJDymbt7dG2IXfQc2EoEP91soiN2M9K8yT26fDDLXsZR0e
	GpsNPrp5LGj+VJmywHVU8KHTxNLm/7fJutOddoxiQNCJmo/IsS3F74KypRCvU/i+6dSMQnTYPcZ
	T4jJwwh9xj9Ph0rEPwPVoJMcNaCZ4puFZD8D/i9a8Uf4NNCM5zRyensrfP7jfQj0kHs0rrPahdq
	tYSCt07vRo1LtD8ZvDkXeRRFmrroXAhbwUxP3T0ACKvoqvY4LEjqufOyWze6PHSJBRWQ6kcUXJw
	VtfoDRgKhExAtcvZfKCoMD6x8OucJ37ZUfR+JYUQTQf5bLchmm5uinurAIYLgBFQer6fmow==
X-Received: by 2002:a17:907:cd07:b0:c40:b59:1b with SMTP id
 a640c23a62f3a-c4679a0ad6cmr205617466b.44.1792593633650; Wed, 21 Oct 2026
 07:40:33 -0700 (PDT)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <atibhAMcgKle37-g@sirena.co.uk>
In-Reply-To: <atibhAMcgKle37-g@sirena.co.uk>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 21 Oct 2026 16:40:22 +0200
X-Gm-Features: AclHuK9P_pXHpQjeIJNu3hhCsP1EXBsiHMxAkTG5K31baLilLfCNdBeEfFXeaCo
Message-ID: <CA+=Fv5SUHkGtBPgzg9C1qGf6aiiFTVpStPd6Os3mTrz_+_5dKA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the kbuild-current tree with the
 origin tree
To: Mark Brown <broonie@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	KBuild Mailing List <linux-kbuild@vger.kernel.org>, Kees Cook <kees@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Matt Turner <mattst88@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Wed, Oct 21, 2026 at 1:01=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Hi all,
>
> Today's linux-next merge of the kbuild-current tree got a conflict in:
>
>   arch/alpha/boot/Makefile
>
> between commit:
>
>   c437950dceb88 ("alpha: add self-extracting compressed kernel boot stub"=
)
>
> from the origin tree and commit:
>
>   0d4d70da348b0 ("kbuild: Mark the gzip recipes as recursive")
>
> from the kbuild-current tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --cc arch/alpha/boot/Makefile
> index 7c2a41c1e2a06,b050753e90157..0000000000000
> --- a/arch/alpha/boot/Makefile
> +++ b/arch/alpha/boot/Makefile
> @@@ -39,14 -38,9 +39,14 @@@ ifdef INITR
>         cat $(INITRD) >> $@
>   endif
>
>  -# Compressed kernel image
>  -$(obj)/vmlinux.gz: $(obj)/vmlinux FORCE
>  -      +$(call if_changed,gzip)
>  +# Self-extracting compressed kernel image: a small ELF stub (see
>  +# compressed/) with the real vmlinux linked in compressed, which aboot
>  +# loads and enters like a plain vmlinux.
>  +$(obj)/compressed/vmlinux: vmlinux FORCE
>  +      $(Q)$(MAKE) $(build)=3D$(obj)/compressed $@
>  +
>  +$(obj)/vmlinuz: $(obj)/compressed/vmlinux FORCE
> -       $(call if_changed,copy)
> ++      +$(call if_changed,copy)
>         @echo '  Kernel $@ is ready'
>

Thanks for resolving this.

This recipe now only copies the completed image, so I think it
should stay without '+'. Matt's series moved compression into
arch/alpha/boot/compressed/Makefile, where the change should be:

 $(obj)/vmlinux.bin.gz: $(obj)/vmlinux.bin FORCE
- $(call if_changed,gzip)
+ +$(call if_changed,gzip)

The existing vmlinux.nh.gz gzip recipe in arch/alpha/boot/Makefile
still needs the '+' from the kbuild patch.

Maybe adjust the resolution accordingly?

Thanks,
Magnus

>   $(obj)/main.o: $(obj)/ksize.h
