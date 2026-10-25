Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792889261;
	b=CkNB/kjC3DE8Dlhkdn+Nk31C7/hzn9ptcN23VtVxe8V9NCrswj7AWMIHY4YlF+WaDAMh
	 i+iodY265hFh28CfuRyLADGo+6EaQiV3u7iNXducri5mPlH2Zq+tRj6x3ocDZGyU0Woqu
	 KBi6TMVmY05+T7FHQv+kS3q5Dtj/F+Wu0wPC2wKs3AVG4q5cwkxk5EiMtrZyY+tRlPmRV
	 4kKfcjsnmrRt8mX4mym+26QNGc5+67MMfNYquYH1txxeueafXMdnkdMOHmGDXfzN++OO1
	 kARbQyv+KM3uDTCSKRuBAikct95MgcrKeP7VDBg3MJUjTwp6DzRW5BHnrQplfMY0vwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792889261;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=nb0uRXvBK+EdWFyShmZhmAjJrdWNQ8t+bMXyHmnTsuI=;
	b=GMhQKfv0VmoTGRfCVGgU1XIn9hfDpLKlrTENS3IDHyqGdJohk+i5y7CCrCLbSuLJTEj5
	 pvZEc/a7mhmTSfSTHcj5Z/8aD1FMQCe9hFeAG8qW0EHCkEGBeiIrSUaMh9DzhVRuh3MWj
	 9ZfdXWisTFnploUO8pvVtcI0ufctOsjFohjqwWvXHFcMc3o7dWnDnawL83RSBde3SVLpo
	 SYIFnPV+sbDQiecE9Bpq23AVCSynbF80fHVwzq/bTWwhNG4Z0dnt9kbUohHMaIKV9pcU9
	 7VI4ZG+ropcXKtZ6Km+v++KAxObO74ltstTgY8qiRjkTP/wFaNevr+cf2ESgsox3MFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ugju8VLs;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F20606A31B
	for <linux-kbuild@vger.kernel.org>; Sun, 25 Oct 2026 00:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28F20606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ugju8VLs
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-84621d8c7aaso865705a34.2
        for <linux-kbuild@vger.kernel.org>; Sat, 24 Oct 2026 17:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792889260; x=1793494060; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nb0uRXvBK+EdWFyShmZhmAjJrdWNQ8t+bMXyHmnTsuI=;
        b=Ugju8VLsoghX2a0iSLRFG7uUMs4aIizMAFRcj9/S35XnhLmFHlHG1xVsTtcqXsbCAu
         do4uWVhuYjo5Pb4U5wMy8WwqgnCF9uESVycAbbrMsh8RDJJ7rAmTXligNdu9uJAgw1xP
         epUcCCTEFjl3NpC8dvhri9b/dQOurV0oCuY6kM2FfBo60eI7koXMjGC5n1wBat13gXL7
         jP3vNWq0+FZiR5Yea+lYmmv7t+0N69Y1StKwBg7o1tpqP7DZz47BnCKl5yfpIw1VENjC
         txMojVOXr8+f4ZhaEN3AMwVG4y6Qxz6En1IfuHY9zvYXC4b2AvRETv8Gb8PrNHzeNBTI
         jR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792889260; x=1793494060;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nb0uRXvBK+EdWFyShmZhmAjJrdWNQ8t+bMXyHmnTsuI=;
        b=l+sKHpnWJeJWQ3w6u7mlnpnbE3vvAGy+AgwaUMeidZqOXJ1NUplQTqkud9Yxk+INV7
         UKdLdHOkLB1GeeZhwohgyH4lKSTkeA35xXMl0t0i9ygn08rX774uJjH7Qao2OivzTOOk
         ZJW4KhK6TSOBDgv48GN2tenalVORJGPx51cJpIH11fr0sT04P/n2rgCgZ/FVvGs+yK47
         SOhp7MwKJN+6wBF+u5bvNL97TwyLnr8zP0zRet+xG+Us1NSbaUkzrVpOi6aI25EHJpd7
         rGP3A0XjwT2NTZwXanoBuoUCibSDuck3H+n3pgr1100fe3VjtiU+SWYrbu7eobK4DJPz
         /ZKw==
X-Forwarded-Encrypted: i=1; AKwUvBw46rqw0Jv3KJOVJgoM/QyqYrNAbaY7golH3hfht/TwpZBZb8WxAFpHfr4B8GACuKa2uylML1l90//g+JM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJK0WTwbkBwyL8c4mYGDJrPnxTQ1GfZYVUcYf6WCA8huUBvlr5g
	pYwbNYF0/njntXlCbZObe6OW4T4tuBo2ivAdPkm2vbWrGcQ5v8rheFn3
X-Gm-Gg: AYBFou0mYAAhd96d1jR/tnha/fl4SrKd3EeHurjfEUQLzYIS6PkeOX6YBEWtbcba9vc
	23QTMwf/4fP3WRwAqEXFTC6ZsTfK0H4k9Sji/Vnm1dp4l+OigzOd96coWYR9TlkqqMjNNsYTMuB
	CdxOswXj+/3Oj/hyqUqPl5Yc9wGIfCg4Qzl/8LMzvpvj51i20F8087Ap9pZ3LFae3PUdo7iXjPd
	VuUoR08tGfaHYM9/XOJLa4sxI4la2zNc9LEqOCsHPe0U7HKqcbxu62e70LX5cC+j2j+tRB2hds6
	o9VZ6GBftPT5mYl8LgAKs7Bu7cjNNUG7Lj2aHI4SGBTIh1Km39Nv4m7IcvmjwGnU7hOID2wzySU
	r1V0gRsuODebh9eqpd32uJ9CpRz/uv481mId8MG6evJ80umrb+hueCKh/RmAo5q7zkFucUgsPK9
	GugzJa3HCzIWD49Xa8FxJEPl8oT8hgmEKADkNcLc60J1okWww+BRQkADNU7CJSozY4qV/DCY/nC
	akgyk//tKj3Xu8gkfkbbLkRUk+7+ILSIw+pRZBTRUV3ydCJk0vefg4VvxdGLc6Dzz1rhQ==
X-Received: by 2002:a05:6830:6411:b0:81c:4784:a5e2 with SMTP id 46e09a7af769-850fda4d496mr2567474a34.6.1792889260041;
        Sat, 24 Oct 2026 17:47:40 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fc002444sm3536258a34.23.2026.10.24.17.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 17:47:38 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: rostedt@goodmis.org
Cc: Leizhen Zhang <lzsx618@gmail.com>,
	nathan@kernel.org,
	nsc@kernel.org,
	ljs@kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] elf-parse: validate what the host ELF tools read from the file
Date: Sat, 24 Oct 2026 19:47:23 -0500
Message-Id: <20261025004723.432708-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019085754.1fcadee6@gandalf.local.home>
References: <20261019085754.1fcadee6@gandalf.local.home>
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
Content-Transfer-Encoding: 8bit

On Sun, 19 Oct 2026 08:57:54 -0400 Steven Rostedt <rostedt@goodmis.org> wrote:
> Definitely not a security threat here. If the object files are corrupted,
> then this is not where you should be detecting it. Unless we change the
> purpose of this tool as a corruption detector, this code *expects* the
> input to not be corrupt. The reasons for checking various ELF header info
> is if someone is porting this code to a new architecture where it doesn't
> support it yet, we want to warn.
>
> I'm fine with adding robustness, but not complexity for an issue that
> should never exist.

Understood, and thank you for being direct about it. You are right and I am
dropping most of this series.

To be clear about what I did and did not establish: every reproducer in the
series is a file I corrupted by hand, one field at a time. I never had a
legitimate object that triggers any of 2/5 through 5/5, and I should have
treated "I can only reach this by editing the file" as the answer rather
than as something for you to rule on. The cover letter asked you to review
the threat-model classification; your answer is that the classification is
not the interesting question, the premise is, and that is a fair correction.

So:

 - 2/5, 3/5, 4/5, 5/5: withdrawn. They buy nothing for a toolchain-produced
   object and, as you say, if the object is corrupt the build has already
   lost. I am not going to re-send them in another shape.

 - 1/5: I would like to keep this one, and I am sending a v2 that just
   deletes the comment you called useless. Not because of the fuzzer -- that
   one does not rest on a corrupt file at all. include/uapi/linux/elf.h
   declares

	#define ET_LOPROC 0xff00
	#define ET_HIPROC 0xffff

   so a well-formed processor-specific object, and anything in the
   0xfe00..0xfeff OS-specific range the spec reserves next to it, shifts by
   more than the width of int in

	if (!((1 << type) & types))

   The tools should and still do reject such a file; they just currently get
   there through undefined behaviour, and on a UBSan build that is a hard
   error rather than a clean "Invalid ELF type". That is a one-line fix with
   no added state and no new failure mode.

   If you would rather see even that as churn, say so and I will drop it too.

 - The separate sorttable and tracepoint-update patches are the same class of
   change as 2/5-5/5. I am withdrawing both; see the other mail for the
   tracepoint one.

On the "porting to a new architecture" purpose: that is useful to know and it
is not what I assumed the checks were for. It also explains why 1/5 is worth
keeping and the rest are not -- the type check is exactly the warn-on-port
path, and it should not be the thing that trips UBSan.

Sorry for the noise on the other four.
