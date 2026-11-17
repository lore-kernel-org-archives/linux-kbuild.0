Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913619;
	b=Hl2jNFWX7wunGkL1xO4zuf29MzGcla2Fh0FcTZgOeVmr8I9CrExDx+NgKv0Qp0Dh5sBd
	 C+0141HlyN9wLoDIgCh8427u4enJy8ZbzQxxHz4wABq6vGw70z0vLWftQsAzBYM30zvHg
	 AnJeS54a4EtdchurZuGfMg+78kwMiZlFmOEa44lLRe49Yu9n+5DAVaYg1TbILh9aEXH7a
	 fylFNwbIH4B45wuDvBZMjyAkI9Qn3CZhPUDr1mbFROH5xtYaUiMtBMRQEH2SxJ5S2OwMD
	 wSHLb2ZYOWcekynB+pFwHl+gCKafxwcUj/pIngQHLYzsxvz0+5pQd/FnSMv+49L8sbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=UCYoCA0l50BOe6cq00vn96utGEICr0hjnvRC24q3j5Y=;
	b=ruAjKlKJzuIVMY1W2ICkihmx+Ng93/hquhSe5ppoTf0Lqc8icqMIYGYsLl5vaBhLArdY
	 986OKWlq7fn0VYtrloGEYvJP+UtWpKOmWjfGnaQCKamN1Hl8+5amvMOEIe1f4u/RrJDxg
	 DfN/3uOOfCeLXuxdmNzHAveD23FXeoBUZGvGqfvQjSdumd2uGNznp9oaIVdWtVVwrCE6v
	 n6lweHeQAUUz/T4YLnE91UEq+1mksFLgAcCnX1ZKBaHTWNXig4nqSUUDt+noiIhSFVhh3
	 Jg1JjD6mfGDBQFASftco5O5UAGFPC7YrflabgkAI1eAnTwmGpxlq3T1bQFHmJtmU6DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ERd9NLfR;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE91606A31C
	for <linux-kbuild@vger.kernel.org>; Tue, 17 Nov 2026 11:06:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FE91606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ERd9NLfR
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-492f563d1c6so1781473f8f.3
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Nov 2026 03:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913616; x=1795518416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UCYoCA0l50BOe6cq00vn96utGEICr0hjnvRC24q3j5Y=;
        b=ERd9NLfR0pXJagwWvhCwABitOLBLt99KRZJyMnlbJx3QkPTEnz2OAOlvdRN5Y7Q33E
         5A8T4Ygqarhd+LytItApv5IflFvZt/PJCh7vEm9nknfttEqnFeDLgbI4h+zqep0PVwuS
         OyN+W+Kvgo/ZhljH4+JqJpUWlGF8yIXTF7ufZ7mkVAHLc5ryi9uESOR5reZfWBFDn691
         bO1SE2Z+zYR3deDigYXEW7m3TTRZ4x4SNQAK5a1RKuaa7i/bmZUsSHrJ3ylOCUtEfpdM
         G1+4WrfcdzpNwcPMjKaVoSdaLd6b2Ib2etqKWEJMo2SU0rVB/KFLS+7ozC7vSQkgf+0I
         +SGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913616; x=1795518416;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UCYoCA0l50BOe6cq00vn96utGEICr0hjnvRC24q3j5Y=;
        b=HVCHH+dJYUVVhX5hPbgNnjvvWi3yHbsOFlCKeDa0WdxF90E1TdNF9nKvXLB0aWe2HJ
         pOkXNVA5V5tC7gk/ih7F5WJ0905ow5N8bnBRbz6BnsH2dddEc5Pn2TGfySJ1uhqC2x/L
         Mtm/2Z41Ucyo+Px6uIPVb7KzA7pbVW6226ReESsra2wB/KgrlocAox08pTOPrOHs6vCR
         xyKYBr9LlYwp9VF7EV+iMhHxv2q1abPZPik2nYe02oCvvH1iIARMcU59XBEhf8wncCnh
         bZyyT259YyzMYCT6TQWbz48lPAhk5dyGH7mOC4YegkR0yAqySslomdsDMQxzJTO/HHz2
         Lgyg==
X-Forwarded-Encrypted: i=1; AL+hErE1E8Vrbz89bX9udqDhcJoJ5PPIAFO8nRfZSIKQc64xn9pEL9yo+hJh0aRfrZ9relfm0/ZdKlr/VGY/JN4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YVAlblnlZM0m1isoakiGsLoXxopQtIt38BuJt8Oz79U4xC5HI
	zkvLwVmJZgEliL9Rt2NANNGR2WHuf5A7ySmQgrJmhr85gY4A0BOxjzl0
X-Gm-Gg: AZFdTZe8NkvXN3ByJWEMGzgjoNtUC4jRqY+7pXxVbi3LFOPcAcDhzCdkvyGmn8lFYj6
	yfyqXK1ko0laCj9GuVFYh1AQEPUkHz0bQweewn35abHqrPiX2y2MiY7Ldvi+bCeW6OfLVqiuudQ
	zfbXokjS3hRWjPhKgTmQr3vj9NojXdVPTJC8303rcOsa2zpPx4UaPfyafGUzpLrvExVPg+E3Auw
	BbziNqVBHxcRLzBWPpvD+DMeHQmION04nKmjwlm6+xwoP62Z76oy+Md6bXsmnp62EBNopyz3voi
	klcM6bjzqzygGnVxLX3QYVb5VeYvugBdwfg8THQvAKpVErnUYs4WvKnZDKctm8brScWlJcQNpgF
	fCknY0a0W2yQoIV7/4EyAcAFqMpmQyiyE4LMCK/l8xfdsxxPd5VNIcblKOrZDLq5sAjNO+plgV3
	FJ3YPEUot2KdC0kMULJ+rOBiKuHXHQecrdRasiZtE5/p8jw+JCuOf0fnN9r6yCzH6LhBDPMZ2ZM
	jXknUdPNLk5+nCCSWi+iOUo5PzmUDPrVtqTNsoKCx2XjXmWVHZgSK0FdVMwY9RXw08LzvfIr9OR
	+0SmbwtqYakTp1O6ePxYulIEahRggWYv7FWmAfrzE+Ox0KNcwVoisKGoUUiYJ05Mmw==
X-Received: by 2002:a5d:5d0a:0:b0:491:6b1b:7f25 with SMTP id ffacd0b85a97d-49c72e85578mr29909972f8f.45.1794913616294;
        Tue, 17 Nov 2026 03:06:56 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60da0a03sm22300526f8f.53.2026.11.17.03.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:06:56 -0800 (PST)
Date: Tue, 17 Nov 2026 11:06:55 +0000
From: David Laight <david.laight.linux@gmail.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, "Petr Mladek" <pmladek@suse.com>, "Kees
 Cook" <kees@kernel.org>, linux-kbuild@vger.kernel.org, bpf@vger.kernel.org,
 "Jim Cromie" <jim.cromie@gmail.com>, "Lorenzo Stoakes" <ljs@kernel.org>,
 "Luis Chamberlain" <mcgrof@kernel.org>, "Andrey Grodzovsky"
 <andrey.grodzovsky@crowdstrike.com>, "Steven Rostedt"
 <rostedt@goodmis.org>, "Andrii Nakryiko" <andrii@kernel.org>, "Samuel Wu"
 <wusamuel@google.com>, nathan@kernel.org, nsc@kernel.org
Subject: Re: [PATCH v4 next 05/13] kallsyms: Fix selftest startup delay
Message-ID: <20261117110655.1294a95f@pumpkin>
In-Reply-To: <sashiko-outbox-218653@kernel.org>
References: <20261117103352.1244657-1-david.laight.linux@gmail.com>
	<20261117103352.1244657-6-david.laight.linux@gmail.com>
	<sashiko-outbox-218653@kernel.org>
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

On Tue, 17 Nov 2026 10:40:36 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] kallsyms: missing Fixes trailer for schedule_timeout() bug in
>   test_entry()
> --
> 
> commit e7ea6257d7756e16690d0150d840ede1f6384772
> Author: David Laight <david.laight.linux@gmail.com>
> 
> > kallsyms: Fix selftest startup delay
> >
> > The kallsym_selftest code clearly intends to sleep until initialisation
> > is complete in order to get more reproducable timings.
> >
> > Replace the schedule_timeout() calls with schedule_timeout_idle()
> > so that the thread actually sleeps.
> > Poll every second (not every 5) for SYSTEM_RUNNING and then wait
> > another 10 seconds before starting the tests, otherwise the tests
> > start as soon an init is executed.
> >
> > This code is in the initial 2022 import of the tests.
> >
> > Signed-off-by: David Laight <david.laight.linux@gmail.com>  
> 
> [Severity: Low]
> Since this fixes test_entry() calling schedule_timeout() in TASK_RUNNING
> state and busy-looping instead of sleeping, should this include:
> 
>   Fixes: 30f3bb09778d ("kallsyms: Add self-test facility")
> 

No, selftest, doesn't need back porting.

(Did I say that before?)

David
