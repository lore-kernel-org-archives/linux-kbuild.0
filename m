Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794666786;
	b=dxTs6OSCkQk47AlMNdHRad9AjEOQEsYbx9MZqkYpkX9Y8S3ZpVRail70Rk+lGPNXJCHp
	 MuzYwWZg6C/8XiTam7C11Lhyzx37CHAE738/UFS9CTfl5+elX23MCG+R8PFG7U5H7HllM
	 lmnVmu/gjkFRsJbqtNaPlAIyAnt+64359Rg3imgfaLYSpPdkZZLgE7LgUApptRoUtuPHr
	 zU1an/90Q50mmLufk4I5UE2Y2EE2/H+TB7Ez9BzINY9iypfnyBdeV83ZIoy0/XsxrO5CC
	 pIJmEdgj54TxWlnOOga6diVOfMU+7fialrAKfVefmZSAU+X83TzpCmkRZPCqI8Q90Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794666786;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=zZTHArb7/cDEOGGmixdYHyste9bMwihASbVf49eSoI4=;
	b=m85g5fR34Fm/UG64UB6A05CMp6xVlWfb9bJ6ZTng1uffJsTmeMXKbA5aOMhmjJkmSMVC
	 M+lHHVC87Gpczdbs3rzjVpWqNxM74oyAvaLvt1MogI8i0yUKRnheELeA0d7rZYDJvSOkY
	 FqML0fpYzhf6ADvIy3e3AWQDkRxFDyv18Ih84h0kL89e9Og9AcTaNi9D7hL+XzsUiWvJZ
	 YrS98Ixo54Wi+XUnacIKgw7PLJ/5X+LQthHqfC/zPtSmPehJHgCbp/0nPSK3UqOP7GsON
	 ZGQRFAthvjaoyqJa4qUCA4uGcwL+U2kwoBVBfQRwEx56J1RDegL0CxKb4oOOPBGq0+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o3UL23wO;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A032606A329
	for <linux-kbuild@vger.kernel.org>; Sat, 14 Nov 2026 14:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A032606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o3UL23wO
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so20082635e9.1
        for <linux-kbuild@vger.kernel.org>; Sat, 14 Nov 2026 06:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794666784; x=1795271584; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zZTHArb7/cDEOGGmixdYHyste9bMwihASbVf49eSoI4=;
        b=o3UL23wOoojCCtw099LOef2o6FXVCYwfWYdM+YI1ELuwWae0ZY5CRolxwTnSJwqRo6
         tbmG7+Rxxvu7K+Xqs5BLB3WcVEs3MzYOF9EXviq05ByDs/kG4OheQ3+y71A0hUo+HVd6
         Eyr4xE6/uhsBTxt3gWXOtnN1bRczoxfiaKwMj2ow7adwVjJoWGJ1Z7bJgjFYxAYXQq+Z
         NNJahNh/iFfyTdhBEZsOABZe6f3g05zsZj5vT/hTlCYUgzzzKDM8gQbCEBp0wgkUBpG2
         fgn6OgovIRBTzLaHd10nD8jN2N8xl0Mrmw4MHrnqFr/sXmdQvxxe5FwyH0GoDA9It/rc
         PquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794666784; x=1795271584;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zZTHArb7/cDEOGGmixdYHyste9bMwihASbVf49eSoI4=;
        b=ovN3/RKSSyba1ymnX+e7+I8XHaG0r+gEsDEFry6LUr6lyjCp7w28j2RYqRodE1k/ey
         N4T+guNygYWxW9nyJOQ51MGKmBTDd6bPNhTBnaJqxyFqOxhAz82mjyo0bVHK/uPway4d
         T0BRgBCgayJhS137fKRZFxvoKFEGC5cSuSxlerLSjtykIgtDxCnbdZ4Tr9CwZ29EFLTx
         k0ZWprOlnq0dwMr5fjOzlK+z9cnISyj+MzAKtSPfxXuITuURxVgqUkpproXggcAp7gIL
         kkNd01A5bZQSPs7ZE4HolVdZmZ9I/YnCGqArRWdM8vA4ns2qqszkGzgNwZAKVuwuOPpF
         ghbQ==
X-Forwarded-Encrypted: i=1; AL+hErGDGIVfNf0exvrst2c4zJ2MZuT5NsWENuu32CUafsmQqnJlXtqftmvK6oQ/K+f0aEL6VR02KxISxwYjuHk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fI6LXUSg+VX8a0bZ2/e+PbJNhlp7j/LFt7XaUKkGuEwF513Sf
	Kpzjz5Xvb+JrzE5fo74es3QXIm0b+J2zXZnCr4Cwutd/Px5hyBA2V95g
X-Gm-Gg: AYBFou3edKr707iSnlfiOd4/uCnRLQ8QIGCe47CZL4L7FpPo25w39x33Mu0n/Wp5h+G
	v9eJC5M+kaHFoq4WpjYb6SEZ3A83WfI54q3tM+R4idq+9684XuxzlwP0BjilTKHcPicM198J5cH
	M8OBl+lM9e8PkR87zLNip4/7HfTF1UBvikKcsQNntyfjOzTBDEgmamG8dRSNFlZjnLXB/Ai454T
	U5iJEBKMXarPd9PyB68f749cSIiKAl9K5QKNCJ38TOjhruAWyfu39d+xX0/vNdsYRPmF9wJLIu3
	eOV3+0XsfjsAhWUb4j83oKvRaM3wGdHXvsRWSCUoWzxpG3rbqI4sMBc17BHJsncZzlFgvgUgbSV
	YZX1L8IIsGH4UAQLHWO0heyqWmPS8bo/EAACxc/t0JcXmgwaZR3IdjbdTQTIBLGOYH0By5pq7qo
	ihYlf5feJcQiIg2TeVn0dHKq0Iucs7ft9V5FeYTABoEy0d3PseLhTvj66VrN6M+xT7cY6Ty9GY0
	FaBEZHPYSXGMtpaCAXBWY+j1g/yi3lGVA7FI1bqT7qcsLet3tgHrEbzVDzLN6SmbC+fFEkkh5X6
	H11wyJM8MkN6HRmxYxjQHf/HAnxpxWSNfqDQxuK0vUVPnpx9iDE0+nvEYy2xP/puYw==
X-Received: by 2002:a05:600c:4691:b0:4bb:5e8c:13bc with SMTP id 5b1f17b1804b1-4bb5e8c13e4mr80850505e9.7.1794666784523;
        Sat, 14 Nov 2026 06:33:04 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb56fa1062sm95802815e9.5.2026.11.14.06.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:33:04 -0800 (PST)
Date: Sat, 14 Nov 2026 14:33:02 +0000
From: David Laight <david.laight.linux@gmail.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, "Petr Mladek" <pmladek@suse.com>, "Kees
 Cook" <kees@kernel.org>, linux-kbuild@vger.kernel.org, bpf@vger.kernel.org,
 "Jim Cromie" <jim.cromie@gmail.com>, "Lorenzo Stoakes" <ljs@kernel.org>,
 "Luis Chamberlain" <mcgrof@kernel.org>, "Andrey Grodzovsky"
 <andrey.grodzovsky@crowdstrike.com>, "Steven Rostedt"
 <rostedt@goodmis.org>, "Andrii Nakryiko" <andrii@kernel.org>, "Samuel Wu"
 <wusamuel@google.com>, nathan@kernel.org, nsc@kernel.org
Subject: Re: [PATCH v3 next 05/13] kallsyms: Fix selftest startup delay
Message-ID: <20261114143302.3eb7125d@pumpkin>
In-Reply-To: <sashiko-outbox-208986@kernel.org>
References: <20261111115911.1142000-1-david.laight.linux@gmail.com>
	<20261111115911.1142000-6-david.laight.linux@gmail.com>
	<sashiko-outbox-208986@kernel.org>
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

On Wed, 11 Nov 2026 12:36:03 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] kallsyms: missing Fixes trailer on selftest startup delay fix
> --

Missed because it isn't worth backporting.

David

> 
> commit 06f0c3fe023ccc28da9c2bd9798921899fb0ec63
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
> Since this fixes the broken schedule_timeout() call from the initial
> selftest import, should it include:
> 
>   Fixes: 30f3bb09778d ("kallsyms: Add self-test facility")
> 

