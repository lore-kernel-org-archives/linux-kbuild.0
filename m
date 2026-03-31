Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848372233A
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 02:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774922837; cv=none; b=VIpKm86XYK6A/YR/2ML35F61/sb1zkDNkY6sxPdkkw4P3kLNrVs0jKX6Ty76DX8LFo/ATKMDbY1z6LnLvVH/BqxUWDleWcpyfvatCvhd46zuED68LrFRiKM73b3C+CIHRRn+pLC56WvW4ONCg0oiZGtLHW4BidIsWjoz3RNPDGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774922837; c=relaxed/simple;
	bh=NzmQHwb3DbgXOf7m7zELxwBshVRaHQ8Qfu7nuXCO/24=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=BWIG0hl8X7MXHI9u3zzeFYOCCe4bbswUK38sGph6ip/xIZIYM9mada1B5kIQN+/tKpp+rJJvnpQvELkdEJH3GcAvA3nZlV+IiKDbh8glMXJimdMSVsUdac/GAdi1BhpstvoJRASLvX21aQwWDPoXRDet2cnvSiQoc4h6mdtp2Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gKgGC5x0; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gKgGC5x0"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2b24fdac394so18515375ad.3
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Mar 2026 19:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774922836; x=1775527636; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q7OinmlPHVygQxvfDVFJvK0ZY1pvhoxnbxOEnZnjSoM=;
        b=gKgGC5x0CegKFVleHEoHftXYrluyoNtECxQz8JJ1cbRIHU0SFA6caBBseHdjzuDpf0
         W+7m9OHFfHm7j7l/V2oeQz4muDgNy9oKWxSYNCx8o9m2X/pNsbzQPqihZtEaWPXLvZdi
         i2qgNelQieYYqFvQWyq4fqBovHH35piZi7LfPYY01f3fDf3qJQ0eOaidxeXmAi6muZo3
         EYs5z4tniecsz1rmwfq50rN+/kac9BP3uhfbsgH81rMAigoQLpLmGO4jayMkD6TK8eNN
         5VizO4lFJ488kiTJ8zH66UI7f2drwA+FTDJ7l4DnBFv/d33g761BHuyXaKt2yCVWRuO/
         2FLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774922836; x=1775527636;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7OinmlPHVygQxvfDVFJvK0ZY1pvhoxnbxOEnZnjSoM=;
        b=Tv7KNwa+gjJ4G1JinUB0Ctu8Phu2iVserb47JQ8dXbJ+7RpOMWCTN+QCJbtfnCFSTS
         CdOOL8pDKGotydFGNM6F9zEbfb1Ej7l8tFIWJwMfalMRmtxGMojPlgTkIdGDa1tSZwpG
         iwaOm2/C54n4hWX3tB4dPA9e+1efwaIhlNm4vQfbFsIkMUraqfhWkm0euteY29pt51kS
         SXwDTIZXrjPsRGQaTZ3XiptjxyxiwxJojludcNDI9GqUfxZkqMUxBB3zFdYz/dnyPlTc
         SodP2ych/HLkhusKa7oCnZG4SsTKNoTMsgIUO/WA0cbFLFHfpbHizbK4r3XWle2NWGlS
         eV7Q==
X-Gm-Message-State: AOJu0Yx2Nex82QF2IFU9EhYNfS5ZJXdH2EIciKiNR1B0Lz/1bzo0Paly
	aBiiUANYgyQLSpakDMf/qYP+Kx2LHMdtxTcp6eTZRKk6WYVHtp/k0K3X
X-Gm-Gg: ATEYQzzMUFat0RMfYRCC6K5y9uRrhUOw73rFZrbVgh6v33P7Tipjd9O+uVdjSO14eDO
	rnlwfZ6pPhcm4KTDTiXkh4uz+dsjlXVXH2XrjidxgIjZZh/I6MrK/aTaci/XKIcYN2aWNYocJg/
	I6ktZGnxlLFR3twqBhFRm0OFFq2dVuwzq3Ot5eniwBKjs01M0rqvQZyUlnjIGjtNXuxRAKDDkN2
	iv+vBsUr+ktcbxgnsBGakKph3ENwZZW0Up9VPp4Pl9UMDWmdfc5UxypRC6otW1k//nk6cea+zI5
	Rf69JL9FkJIF7nMTvepIBHNCtUEZAsAr+ibpfKhjt2OsxY4ZE9OFgKtwInLYOnJdVeszUMLn7Wi
	/1qjZ6eayiDGdqPK/gVvNkcnFtGNEHyedwsELFpzSjrI+z/x5TxCoqpDv05TZnoabt8XlFT9qY8
	lWgYbXDI2t8NZYX/QYpAkTtA==
X-Received: by 2002:a17:902:e809:b0:2ae:4150:3118 with SMTP id d9443c01a7336-2b0cdc3b9d9mr146889945ad.12.1774922835833;
        Mon, 30 Mar 2026 19:07:15 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24264256asm93998405ad.13.2026.03.30.19.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 19:07:15 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>, linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, arnd@arndb.de, Christophe Leroy <chleroy@kernel.org>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: Re: [PATCH v4] char/nvram: Remove redundant nvram_mutex
In-Reply-To: <20260330103530.6873-1-venkat88@linux.ibm.com>
Date: Tue, 31 Mar 2026 07:19:54 +0530
Message-ID: <qzp0n4xp.ritesh.list@gmail.com>
References: <20260330103530.6873-1-venkat88@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

Venkat Rao Bagalkote <venkat88@linux.ibm.com> writes:

> The global nvram_mutex in drivers/char/nvram.c is redundant and unused,
> and this triggers compiler warnings on some configurations.
>
> All platform-specific nvram operations already provide their own internal
> synchronization, meaning the wrapper-level mutex does not provide any
> additional safety.
>
> Remove the nvram_mutex definition along with all remaining lock/unlock
> users across PPC32, x86, and m68k code paths, and rely entirely on the
> per-architecture nvram implementations for locking.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> ---
> v4:
>   - Remove all remaining nvram_mutex call sites, completing the mutex removal
>

Let me cut paste the review from Sashiko here..

    Does this removal expose the underlying raw spinlock to concurrent userspace
    contention?
    Looking at ppc_md.nvram_sync() implementations like core99_nvram_sync() on
    PowerMac, the code acquires a raw spinlock (nv_lock) and performs hardware
    flash memory operations with polling loops and udelay() calls that can take
    hundreds of milliseconds to complete.
    Because IOC_NVRAM_SYNC does not require CAP_SYS_ADMIN, any user with access
    to the device can call this ioctl.
    Previously, nvram_mutex provided a sleepable barrier for concurrent
    IOC_NVRAM_SYNC callers. Without it, won't secondary callers spin on the raw
    spinlock with interrupts disabled for the entire duration of the first
    caller's slow flash I/O?
    Could this prolonged spinning with IRQs disabled completely freeze the
    waiting CPUs and trigger NMI watchdog timeouts or system lockups?

First of all the above problem is only being talked about PowerMAC and
not for x86 / m68k. In there I think, we just read/write few bytes under
the spinlock.

On PowerMac too, I don't think the above problem gives a reason, to keep
a redundant locking at a generic wrapper layer which can affects other
platforms/archs. And the comment in PowerMac code above nv_lock says:
    // XXX Turn that into a sem
    static DEFINE_RAW_SPINLOCK(nv_lock);

So, it looks like Sashiko review comment can be ignored, and the patch
looks right to me, which kills the redundant mutex lock from here. So as
for this patch please feel free to add...

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

... But I would also let Chrisptophe comment from ppc32 / PowerMac perspective.

-ritesh

