Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA5D3559CA
	for <linux-kbuild@vger.kernel.org>; Thu, 16 Jul 2026 18:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784227950; cv=none; b=iEUfmle0m3a2hzDowdBtKwI6Xezc6d1Z6DXL0sfenbsCgpUro4V11XIMLmBn+JNTioz5deBC7Se8Oh2AuzimrjN2FBaH17QpslCJJhbZQDJ2jR2o4piERU4wu2q/Nj6LkrzlJAJMYw4opFgcTPnOqgusa9IlOMHxwFOb+XN6idQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784227950; c=relaxed/simple;
	bh=NLrB73w0i48zkDrP+TaBs6d1J9588JmhTqUM+TqOpw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=spMxT9nTjQZQ4P/dGl7WWMoy9QVvDgLsbzNrxyrzT25nl0UfcF6Wu8rYzvFw87ZQCcMizTHuG7b3bKLfbGXdWU3jRnBMlcz4wlSEz70hpmpLZvmzz0WMtDF7y9e3QUZd/9wGpeIVRBfsntcABDqJEoWK5fJzXo8IJp5GS03sxLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L4yvomER; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=dztq8K7D; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L4yvomER";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="dztq8K7D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784227945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nDRDe9D1HHJSTHMTwdgGQK64L6aUl3+WolbMAsnq2JE=;
	b=L4yvomERtV+eUbO7miT2RobsHbQXJV+TXXkZkqDK90NBafRGjcPOmnNGXW7AoQmf8yEyGi
	uxXVBeLPhBxrmTTJeOVk6gfDWxJ8CCYpogvFz1nGMroB8poLh4gyH6kotXOtrSySAbu7zf
	3xomvCr4A698eKnHJRcicl3DdDBXVBc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-26bI7RIWOSG1nIBRoLdRHw-1; Thu, 16 Jul 2026 14:52:24 -0400
X-MC-Unique: 26bI7RIWOSG1nIBRoLdRHw-1
X-Mimecast-MFC-AGG-ID: 26bI7RIWOSG1nIBRoLdRHw_1784227943
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-493c55d5ce5so40242915e9.0
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Jul 2026 11:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784227943; x=1784832743; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nDRDe9D1HHJSTHMTwdgGQK64L6aUl3+WolbMAsnq2JE=;
        b=dztq8K7DNtm2VDFluboL+EQ6yLeSQCY38ECVCLbXgLkhtv+aU8FFWReNL9Hrk5Y2xN
         iUabPb2Wo3QNWOhoO33zJo0A8mdssdiTGOAsyFhJxh6uTziLFzZyrvJFyheD3DH/hvnp
         R4SBA1IEUj5+T2HRVw6tjUN1j3hqoPa1dR91Conb4qQKMHDtgSZL1cwZckQhHugwFufw
         3Tcq5Ez3nUKO+kCSD+eSQG+jlVlDLNPLZMbPFJCaNMuzPMPB3iLTV21X2P5snsNf857N
         fQYuikAGgkv2CL+C7X4tw9Y64z83hrxWpaRP0sB5ziNdOcemVXcgYnfW7ve/F/euKjrw
         lqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784227943; x=1784832743;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nDRDe9D1HHJSTHMTwdgGQK64L6aUl3+WolbMAsnq2JE=;
        b=pFvUkyzY9jToa53DrDImXMpY472ncMmvjyDNBrZK1K47XZZNMqexB8Zx/B4qe/OUW7
         HBdO2VRsHwvv2xfBzZdrDTJGnMZeiiAUSZU+nx7y0hzH3jBKzeDfkt0r60GkWh4NB1ek
         FNbQMkClq4SgyBBN8+TXJS0uFb3Aw5xFfHR/1dvQKudXmkoo3PBmOv6Z0aBI1cTdWPu6
         flMaCePTeaXveRGEKuCzTJz5jlQ4C+EOVEUow3L0sAM6bZ4w65cLspApohE3Pv9u6Lc7
         JisCrdjdjgxMcNw113bvdH/0HJmnGHyi23l3zRwm2TKhPVOFEUEY64eCUsJTN/nWfDP0
         Ca7Q==
X-Forwarded-Encrypted: i=1; AHgh+RoNH0TasdHSh6p2q7PuzExBNkLx/Yu71dFK7CiD0OsJUlaCqK5n+PY2jOfxOZrQ+TJ20B+dDb3RWaRb/wM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDbzfjnQm19vpKB1Flu76EdylrOWRcK0dptNuflMzMjFUwdcdR
	+VVOP3x0in/5e7A5+q1sz2r46V3NlL2DvCMqfGM35LSRTAk0sDRKM/G+5QdgRChoJ4OkWWhP+HY
	fNRrdSR8xn5BOuMQHWUwgJCjKmUbsMdc0JVsphLO9Y9jubmx7Bx+h+HSdDLY8H3DV0hsJ2cTVHg
	==
X-Gm-Gg: AfdE7cn3qC78qbiCxJPCQsEcqH0wHj1u/PlPk/Q1BWum6QqWr/cxzPWLHtmKnL+urQS
	qu/t1jXfYMjbKBtBS2sN5NYTGl2vYbQWGV0heoZBOnU+VIetPprevSt/rS7Ve+HOnJzyKUohZ5j
	3pDocqnpqPNZ6p2hFX9ET6IUnkSi8yNgHYn0eSfghCzA+kR5zTL6TzHewxhl+B3rLQDrzuv/viZ
	ZvJ9fundbDNuNZasaA5KfsHi+pxp14KnaC6xlk3M+JSpB0vRtOhOWRAKUvsPY9I9D86Ke15oalK
	BKjRT3DMMJZZzYKgqyxjZr0Yf40hW+RapAxlYBuZ3MKeZTTwC+m7+aaKcL1H/CTCQ+2kbvhzeA=
	=
X-Received: by 2002:a05:600c:3144:b0:493:f6c1:2f09 with SMTP id 5b1f17b1804b1-4953c145152mr102194445e9.6.1784227943027;
        Thu, 16 Jul 2026 11:52:23 -0700 (PDT)
X-Received: by 2002:a05:600c:3144:b0:493:f6c1:2f09 with SMTP id 5b1f17b1804b1-4953c145152mr102194105e9.6.1784227942600;
        Thu, 16 Jul 2026 11:52:22 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.112.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e8c2a3sm83790945e9.7.2026.07.16.11.52.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 11:52:21 -0700 (PDT)
Message-ID: <2030a963-33bc-43fe-9a2b-9c626d7d8360@redhat.com>
Date: Thu, 16 Jul 2026 20:52:19 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scripts: headers_install.sh: Normalize __ASSEMBLY__ to
 __ASSEMBLER__
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Nick Huang <sef1548@gmail.com>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org
References: <20260309-uapi-assembly-v1-1-a7ebfbf14309@weissschuh.net>
 <823e3bf3-ef3d-47cf-aff8-1668875a2f38@redhat.com>
 <5e05be8c-e9b7-4da7-a182-eefc5043cd2e@t-8ch.de>
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <5e05be8c-e9b7-4da7-a182-eefc5043cd2e@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/07/2026 18.40, Thomas Weißschuh wrote:
> Hi Thomas,
> 
> On 2026-07-16 12:24:07+0200, Thomas Huth wrote:
>> On 09/03/2026 16.58, Thomas Weißschuh wrote:
>>> There is an ongoing effort to replace the usage of __ASSEMBLER__ with
>>> __ASSEMBLY__ throughout the kernel tree, see for example
>>> commit 287d163322b7 ("arm64: Replace __ASSEMBLY__ with __ASSEMBLER__ in
>>> non-uapi headers"). The latter is automatically provided by all compilers
>>> and preprocessors supported by the kernel, so the explicit definitions
>>> of __ASSEMBLER__ can be removed.
>>>
>>> However the UAPI headers might be used with older (< GCC 3.0) or
>>> non-GCC-compatible compilers, which do not define __ASSEMBLY__
>>> automatically.
>>
>> I just had a try with gcc 2.95.4 from a Debian Woody installation, and it
>> defines __ASSEMBLER__ automatically when compiling *.S files, i.e. gcc 2.95
>> does not seem to be a problem. So can you point me to a real case where
>> someone tried to use a user space compiler where __ASSEMBLER__ was not
>> defined automatically? Otherwise, I think this patch could be reverted
>> again.
> 
> I don't have a specific case I can point you to. My goal was
> consistency. Therefore I am against reverting the patch as long as
> both __ASSEMBLER__ and __ASSEMBLY__ are used in the UAPI headers.

I've got patches for all files ready and posted them a couple of times 
already - the problem is, some maintainers are not responsive / ignoring me 
... so I'm afraid but I guess we'll be in this inconsistent state for a 
little bit longer...

> If we want to switch to __ASSEMBLER__ for the UAPI headers today,
> we should instead invert the logic of this patch to consistently use it
> everywhere. After all UAPI headers are migrated, the normalization can
> then be removed.
That sounds like the better idea to me. Could you maybe send a patch, or 
want me to do it?

  Thanks,
   Thomas

