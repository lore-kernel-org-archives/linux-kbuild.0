Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0B84A3411
	for <linux-kbuild@vger.kernel.org>; Tue,  8 Sep 2026 22:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788906881; cv=none; b=jEPW7nBd5aduSKd2tacVPmdw9PU/znK6VZHtIEClxTDI9GHkhTuenu/m2trC8d3owVa0/XlLFlDjJeC9Udr4Yak91u4gluT+nXDCXA7J/XgtqizqeGklNhXi/FvAxXjB/asdS+CetPI+zhdWzOd6GBMi6dDXAY91hGFUbiuP43o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788906881; c=relaxed/simple;
	bh=htNILk9Kpq12336HFpWbDN67/SR46TQMYtfCjV9wRxY=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=WrfrnungjJIq7CbIoDxcBeZlnFcGxpWwaBFU/waJ/BnmC2GTYd90W5b7oPalm9dUwHBMvHIkBQ5gMRCiXCEYo+nvyyVdLKM1ydEECGmb2ZFkOAVvqjFcUwuzLDoZ0GDGPJbuZa17oWOrDdNtU4ZrxcRV4DgWpT2Klq58Fl02P5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uaYTHfPu; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uaYTHfPu"
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b1281dd14aso5016650eaf.2
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Sep 2026 15:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788906878; x=1789511678; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y6DHdss8MRJ7r65GA41ught1FKJ932kAtSg2l2oUqQc=;
        b=uaYTHfPueU0TDrIv7KfTmvg3C6htsYvnOGJ3Qni25YFImkYLkV92Wh/3Nz4Oq2/CKl
         RPPNGU417AnV7rHYhfb6+9CGAUxH3qKjPJ/zZt7Imwkr6AJwZ94eOudhGpHCCDrBR+A4
         cstus1mk+P7bbepGyatAXAOmVVFrPFNGOx7ZbhCVXZBpEpoygqjRHqAe1ssYn/72ItzA
         u5GLCMjx7HcsmJamW6aKZkPpk5ZIwfFyfVC/0A03jh+RLXmbRDiUC/l7kFc0sYvgQ4mZ
         HQETneyJDLiJCe+L1xN6IIxELlBKPd325sE8ZsVwKKzWTGUun6yJv87MUQBZNkUy/pVJ
         oN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788906878; x=1789511678;
        h=content-type:cc:to:from:subject:message-id:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y6DHdss8MRJ7r65GA41ught1FKJ932kAtSg2l2oUqQc=;
        b=AgZXAkDfLBEoTWBBhYqYsktVeV6pSC1wdumWSIl7tM4VnRdG0HKD65RlCu65Ji15Fq
         zZbwf8DCoRYE1kDPGCC90DRqA1TT4QA6sNr6FfVxOzD7dMqsj8voFupdB/SUfxS7q4lz
         Ty3d96+2EJI/7aahJFQDPMBZibctnamN2nT+tapslf3JL3ZrwN/TML36qKbjiDOIuZRh
         T4KwF6F/o3wTPoUpaDswSfHnFIBbRE7b0WJly7o1YGPUxDz6cEEx95eluZz5D7i9AtAg
         K+lsnXtITWduziNJL29h/sruyKPvZ9ax+muZfY9C2yhBHN2QZFELYOC4BLrcstgFp3SQ
         uuEg==
X-Forwarded-Encrypted: i=1; AKwUvBwM+YwwZF3+Z3smM23pcM+sFnOOzoWO0Tw+SHCTsC4euqWBhLGtRaC4/sNav7dKv9O4omy5flictK2Xm0w=@vger.kernel.org
X-Gm-Message-State: AFuF++mbBCyJsLsgD1JOqwhzW0xLu+TO9gdxqN5nZkaicBdaqESrZGk0
	1F6TB3rRVjZMzhiMf4G4u52yTpY/lnen2t7Qtx65Mx2ODczUVJjtUKJAyQDriitj8clj4ZgLNep
	lZ1bDHtwkpsvUvykx1xHzNlfAjw==
X-Received: from japm26.prod.google.com ([2002:a02:cdda:0:b0:5f1:325b:8e4c])
 (user=justinstitt job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:179b:b0:6b6:c0bc:365c with SMTP id 006d021491bc7-6b6fcbdc9dfmr18638803eaf.22.1788906877369;
 Tue, 08 Sep 2026 15:34:37 -0700 (PDT)
Date: Tue, 8 Sep 2026 15:34:35 -0700
In-Reply-To: <20260401092027.GW3738786@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <aqCMIFRHEQ3H9qad@google.com>
Subject: Re: [PATCH 3/5] compiler_attributes: Add overflow_behavior macros
 __ob_trap and __ob_wrap
From: Justin Stitt <justinstitt@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Vincent Mailhol <mailhol@kernel.org>, Kees Cook <kees@kernel.org>, Marco Elver <elver@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, kasan-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, llvm@lists.linux.dev, 
	Linus Torvalds <torvalds@linux-foundation.org>, Nicolas Schier <nsc@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

Hi,

On Wed, Apr 01, 2026 at 11:20:27AM +0200, Peter Zijlstra wrote:
...
> 
> So I would like to second this option as being interesting.
> 
> But while pondering it, I did want to note that all of the options, with
> the exception of __ob_wrap (which is effectively what we have today for
> *everything*), will be 'interesting' to compose with _Atomic, another
> one of these qualifiers.
> 
> Now, in the kernel we don't use _Atomic, so strictly speaking I don't
> care ;-) But here goes...
> 
> Something like _Atomic int __ob_wrap, is trivial and good.
> 
> _Atomic int __ob_trap is either doable or impossible depending on how
> you define the result to be on 'trap'. Specifically, the semantics
> proposed where it keeps the old value makes it impossible.
> 
> And _Atomic int __ob_saturate is equally 'challenging', since the
> fundamental thing of 'reset to min/max on under/over-flow' is rather
> a non-atomic kind of thing. Look at the trouble we went through with
> refcount_t to sort of make this work.
> 

FWIW, I've moved to simply disallow OBT+Atomic. We've got this under
-fexperimental so I'm well within my right :). The idea being: __ob_trap
isn't workable with Atomic (depending on storage semantics) and
__ob_wrap isn't very useful there either, plus I had some parsing bugs
where specific ordering of things could result in OBT being silently
dropped with _Atomic and those magically go away by disallowing this
pairing all together.

I just opened the PR over at [1] and it is still pending but this is
probably where I'll go with _Atomic and OBT :)

Link: https://github.com/llvm/llvm-project/pull/222179

Thanks
Justin
