Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2619538643B
	for <linux-kbuild@vger.kernel.org>; Fri,  9 Oct 2026 17:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791565820; cv=none; b=Uqa1ZABZtjS+JcDCS8WRIfaNuM3aj/js43LUcwdPmfqSwBqCRyE1qKGkHovNskJxM4IxEvcs211U4Oxt6IriYa7zcQcltVGUlJh0zxDa4cAM2KwCPSlBla3nsChkbw6XmxCQijDXwbrORuRX+qbupXgL5k3PxziU7D6ZAW6/5CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791565820; c=relaxed/simple;
	bh=VXRz2PDWk6oOBFGq5vOTwINeX0a4QQnNEUao9lnM22A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kVq14Im3SHkqmCFWLQGOnwE5FTFZPvO2tgolInySu+iIB1/6pq+XODQKYhaa5TNWzuu67m4FPqyJFywPrdpLQ97WlWaPZo4wRBN8QEKLIvUb5s77EKqE//4WbcqQvqQ2c5HIWSanvO72DbeBHup50R6+Agl+v44MQ1cszFJUHR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=egicon.com; spf=pass smtp.mailfrom=egicon.com; dkim=pass (2048-bit key) header.d=egicon.com header.i=@egicon.com header.b=BMjdJ5V7; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=egicon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=egicon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=egicon.com header.i=@egicon.com header.b="BMjdJ5V7"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48b02a2359aso38171f8f.0
        for <linux-kbuild@vger.kernel.org>; Fri, 09 Oct 2026 10:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=egicon.com; s=google; t=1791565816; x=1792170616; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QlbHscdz8tXNxFSWL/RXlFVB12NdLIol4JG45a+qrVo=;
        b=BMjdJ5V77hv1yeF3mCsenxZI0nKQX92oFJi+db4z0lO2A+eL6x2PzDbcluZRnspU0z
         yGH275i0TZY7Z/0f/evUo6vQXkoqKAYIRQfsATx6duX/Zt/tx0mEeI759L2eIKbjJlYo
         l/YcKhX+1mZS8i7eyADx52wxksIq6jvhL9Ko4csrOG/IpocSsJVuuatUaN1ba4+7Ydgg
         gBZsrevvq4IaxvyMQXSdc7RH9lk4Rx9wFRMegYl6XmWLHBE9GzvlVtqmqMhXJX3OrIk3
         AwsTzcfllzuXOgvHfYhd1f+JwELSTyBfbp9ok/lnh019Plm+SvxF7XvJ1DYuy4hRvtoK
         ZQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791565816; x=1792170616;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QlbHscdz8tXNxFSWL/RXlFVB12NdLIol4JG45a+qrVo=;
        b=vlwZHH0Fj4z68uwa2Z6v96VYSiTXrPlhXFUqvHWNxbX0+5Fz+lTJAhjP5iNnA2C7A7
         2RKPtTZqTE4lSviVBqaaiOULups1fOGQn70LloAUH+smrlHrpdvlDNYVmwOvB7MFLDlL
         7c+YtKDSihthGVsWDlOZnWvBzHNMhzKJBuz5sZ38VTTI5Q0ZK2qgk2QSGNgafEGEFCFU
         knSYJZdlf22WZV16caJzjNiYdSDNTcqFbBP6cU6A9E08zCFKpyzJjP5uRAsUxcfinxzs
         xQdlOKxaVJioM+kvniNwgvmsbQboidmXUzqmiBOlx27PsxrZosjTh7+/sdTw/bqnvQJA
         1mGw==
X-Forwarded-Encrypted: i=1; AKwUvBzISalCS7Qi27c6xVdeyKlsb0lZk7xJ1WA4+8NCFNPJJz9P+gz+0ILvOgiB5mRXmq/1zIG8Z23V9uIYy6E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJByi1S1zUVRU7dqeCtmZLJlkC1hISt+jMzsLWdqGcQczJXG8Sa
	CKZWqzcw3VuWvLqkiFaIV5xCfZIKWk0o0L7lCIObIR8a/kbgXbO5DZnztHZu7TB86w==
X-Gm-Gg: AYBFou3l9nANwwzUaIHpdfuFnHM0axjHQ7KH6O8I6xPnFrtbV6aptobm0ucQ7/P89wl
	D83GycWTspBXbWgm2F4P3NMyfIN6/mhulGd0WltpdV8LnzyK5APvJynTrWpeMWD/jDta0/R86+6
	tiBosOjE7Gp+NukmEB40n31fXZWVhetwwaSKc64sSA+4T6g7mJom7hsftQn1C8awCL3uSCwNQAt
	lkhV4lIkeCSM9DbP/GzIFltIqzcxk5oyfF1nkSjiaF3NzfhznezdmBOBOe0u1n7JSVcqVTDUgGX
	EiY6CAn/LBvwJztnv6p12h8th+rVITOTiKyp7MEcq22/TJMVHGu7FbmLAYWv9dyzYtYSnoaxLaV
	YDYGTyA4rULq36PxWR0/dBpggVK5auvCy/dDnJpYnegkjaRWj5GF0/c7Ns/5VWnukLOr7VNndRd
	5EvSMAX52nCPKV0ywQgICxZbM8oQclChNn4LpzFurYKpIT6QbLs9mXDP5WNEOmqQIJx6+apLYfk
	lceeXH2M4QrRjyhR5mdvhbuinRCrJK+07JQMmxpyiwg3lMxW+MoJnaS
X-Received: by 2002:a05:6000:2002:b0:48b:f1f:8b12 with SMTP id ffacd0b85a97d-48db9465e7dmr5874958f8f.9.1791565814136;
        Fri, 09 Oct 2026 10:10:14 -0700 (PDT)
Received: from egicon.com ([37.179.95.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db98c2800sm4858910f8f.26.2026.10.09.10.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 10:10:13 -0700 (PDT)
Date: Fri, 9 Oct 2026 19:10:12 +0200
From: Massimiliano Marretta <massimiliano.marretta@egicon.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: David Howells <dhowells@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, keyrings@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add bulk signing support for PKCS#11 keys
Message-ID: <fdygyv5nwbgdasmqivbdy23khis7t3bypholrpbk2gflpywtb3@jieynyyox5nj>
References: <20261009101915.495734-1-massimiliano.marretta@egicon.com>
 <20261009135228.GA321175@quark>
 <hhgoxv37uegtx3memo7spxlesoywbsnavzoezdg7rdrfwog3ml@tx73cw2yhu6n>
 <20261009162442.GF321175@quark>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009162442.GF321175@quark>

On Fri, Oct 09, 2026 at 06:26:08PM +0200, Eric Biggers wrote:
> On Fri, Oct 09, 2026 at 06:13:22PM +0200, Massimiliano Marretta wrote:
> > Yes, I have been following that series. It is a useful approach for
> > its stated goal, and I am not arguing against it.
> > 
> > However, in our case it is not applicable. Our product depends on
> > Wi-Fi modules from Ezurio that are built out-of-tree against the
> > Engicam/NXP kernel. In this case the module hash is not known at
> > vmlinux link time, so a Merkle tree computed during the kernel build
> > cannot cover them.
> 
> But do you actually deploy a kernel (maybe with some in-tree modules),
> and then deploy the out-of-tree modules later at some totally separate
> time?
> 
> Or do you actually just collect both in-tree and out-of-tree artifacts
> into a build and deploy that, and the fact that the in-tree build
> doesn't have visibility into out-of-tree modules built separately is
> just a limitation of the build system?  If so, asymmetric signatures
> seem like a really unnecessarily complicated workaround for that.
> 
> - Eric

Both the build and the deployment are separate, and we need to be
able to update the out-of-tree modules independently.

Concretely, the build is two stages:

  1. the base kernel is built from the Engicam/NXP BSP and its in-tree
     modules are installed into the rootfs;
  2. the Ezurio Wi-Fi backport is built afterwards, in a separate source
     tree, pointing at the kernel build directory:

        export KLIB_BUILD=/.../linux-imx-engicam
        make defconfig-lwb
        make
        make modules_install INSTALL_MOD_PATH=/.../rootfs

     and its modules are installed into the same rootfs.

So even at build time the two trees do not share a link step, and the
kernel has no visibility into the Ezurio modules when vmlinux is
linked. That alone rules out a Merkle-root mechanism computed at
vmlinux link time.

But the more important point is deployment. The Wi-Fi stack is
delivered and updated on Ezurio's cadence, independently of the base
firmware, and we must be able to ship a new set of Ezurio modules to
a device in the field without rebuilding and reflashing the kernel.
This is a product requirement, not a build-system limitation. A
hash-based scheme tied to the vmlinux build could not cover such an
update: the kernel has already been deployed, and the new module
hashes are not in it.

Asymmetric signatures are what allow the two halves to be produced
and updated independently, and still be verified by the running
kernel using the public key it already carries.

There is also a compliance requirement that is independent of the
build system. We are implementing EN 18031 under the EU RED, which
requires secure update mechanisms and integrity protection based on
digital signatures. The compliance approach we have adopted for our
hardware is a hardware-rooted chain of trust based on asymmetric
signatures for both Secure Boot and module loading. Even if the build
were fully unified, the signing path would still be asymmetric, and
the HSM constraint would still apply.

So the question you raise is fair, but the answer is not "unify the
build" -- it is "the two halves are genuinely independent, in both
build and deployment". This patch only makes the asymmetric signing
path that already exists practical under that constraint.

Thanks,
Massimiliano
