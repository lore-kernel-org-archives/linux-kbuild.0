Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793643658;
	b=Ttcy/s859ZicLP8iStII3PfGQ8TxYqSH1dIn9AB02anfBGwcWOZ+ookNSU60xa499guf
	 BtLAVT8ZWXa3yYlXF8wLFeOGgnNDrbgCh/Gk0rLuS2Nws1irIkfvlW4M+6/YDCy3dPia1
	 A6mlKXsIMSdfwDXyzXLuQb1vsJUnWfDcWcORNfg9uO/pQ/UULppkUeV2u/UrjIIQdiRZw
	 Ot8kwnWXlX7/7WTCOEBFOOhholfwZNL47xhvt9VwQNTxEEoRISuFGaLPrbpERgnAUiAWt
	 +hhEeD85oBU7nClclqO4ptxnJOARiwSG2Cbb9F0gBkmFmQrRdHXQeidZrI/+ESEAVag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793643658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=RT+7IFXxziGze2U8VEflZ1s2rfPZLxwW/lG0rTRv44g=;
	b=PVDD0FCXdK9qmJX1bGD9CCAc2DQezaP8ga86oExUjxbZaeM7NotRW1r/bKRjBE/Cnzfa
	 b4VtV+hlaVFl47OG42ccrQC8DnQOg1bKn/ZwMg20k8DEEyLBDlABtZf9DiTkNQCSOycAP
	 IK17qxIO18ILS3T0VONVk7SqaUmGSP3sB/7pivM7MCG4SB/POy8px8L8iiLzpSvkLNqVw
	 Xny2R7A/nS1R0DabnTv4OWWZPO/lp37jVhg2Fb2BUvwzhh4fqxNoudlneSaoIyw0T9gJH
	 wZHMP0RFbQDAnGedhea7UQSRyEYZD6wjDfJNWrLiGb2qnEeuZF3vnRFTi0Jmi8rEDpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=hbWSqaTY;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF25606A326
	for <linux-kbuild@vger.kernel.org>; Mon,  2 Nov 2026 18:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFF25606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=hbWSqaTY
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c434376dbebso698185866b.1
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Nov 2026 10:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793643655; x=1794248455; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RT+7IFXxziGze2U8VEflZ1s2rfPZLxwW/lG0rTRv44g=;
        b=hbWSqaTYLs+ExwKEXjn30jemnSLwP84y+8a5mzqJNFFvD+gs/jCIBNXBXTZUPvY7M+
         9XzDuZvTjrlZsAMzrbT2ZdqgOd9aNZp1NEZfhLoJH5O+zMS4NI2W7457VXPv9OuHsSBj
         XP38XghTLfVNQKBLQWDjGmwxZarhEnajHv/SY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793643655; x=1794248455;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RT+7IFXxziGze2U8VEflZ1s2rfPZLxwW/lG0rTRv44g=;
        b=M/aGL2kfjKM5JMQa0sSY0SiT/Io67xSX6+QJaLqxVbBdKl9/cOrOnWsHp7zKOa6wrV
         Yu4uJcMaG5eF+CHWEIGoQRdk0OEyXkhKKOdja1gNrEFPBzQ8ZlHhiTRzxAUur5EBtVON
         7An0qzGT/xBcMt5mOnMOLz5OX8uBCRtRttRwUfR4sbx93kJdZZvqiJXky3Qo2mskoAWI
         eZrRptt2hZfvak1mLrbo9QfJRVOUiQMSFD7iRCRJn1Pn9MzxvWsI8hQfH8ggFBn2abcl
         ZJc7CjgKDI/zvqxTOKcbwNgSOVlB8QU3NDTzoJ6ZY7o5itvY6g+F30B4WiL0tb66TEfY
         OxzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxulrs4Fy+yCJDYYhnauCFw/MCVCgOfVaNyA056S0crWCcvYS37aNzv3eSJbpsUPwdhtaHNQKqRN33pSRc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCWtq8tGhEX3DQCoIabLJlWKj+HpLSNJfpf/560cllqmEqBX99
	k3+Ymevr0gXc9iUHqnq8yseBWG9EnoOKGHKlSFYM+EBcEy4iFBydYFSTYlIv9dPYBawwGp8hab+
	X2/IN0Rvhmg==
X-Gm-Gg: AYBFou2lPGdH9uWBuXOPNICjCIZVXAaDZxjpEa5PLIG4GhJeQceH8th7Ks669s1AXta
	umfcZaN9xl9dr1X/5Qt53GyqZChgFdoWySGEIe3VHq9UsVoixw5u7Mqw1NMpQ/6D+6DZMRzHhgX
	1ATG73+PMfYHGXTRtfHqxebiCHdvf3pUR1kxeF87DMQfof65NEpQx+GxO+KkHYCO6yUBSwiLA1S
	iwun8fd2WwyuUwy0Mkoov2whMCn44CbrfDgDj37N+7iMR4ppPofwA1s6DvE8bXRVk7hjleA8gdl
	uEDZbI8WwENQEHMpNSWY1zsOdh4XTIoPvI44JiJYfyHkHOyjFG8MxOEQ+vKv6cxr4t+Sx4cT31Q
	Kv/0sBpaUvgUAYsg/H1qXQ6oWPXwtQrFPEcLsUZpleGLkQmanxYjliErU1PM2RID+01IhLP709h
	V6jMAJ/c1HsI/vvo15+tAoTf9xpYxvCh/iJ3aKZUZSOZmum/OuuvFuWL8rm0+MOTN20aG6SXICZ
	dp34nJwkiT6g8LeWMgHAx4b5R+XFF3wbI97Uz9o387mNds4PTxSQrPD4aqrZE4dw6lgMffJvW8B
	oY4OPo29nzZZSzSBgZ/twjS52BxXloC2bCxcWAvgyLoOyivQHBp62AUld5b0DztKeTQqT/gapMv
	R/Q==
X-Received: by 2002:a17:907:3e06:b0:c2e:7fe7:2898 with SMTP id a640c23a62f3a-c4ca7a6aa23mr969287866b.12.1793643655113;
        Mon, 02 Nov 2026 10:20:55 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebd3a329sm14390966b.8.2026.11.02.10.20.54
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 10:20:54 -0800 (PST)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b1aa27963eso7751860a12.1
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Nov 2026 10:20:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByW/rovJEd3QdotLtwihSCC4eIytJownbCj5vd7PPWBgcIhNT+xUK28zHsvRITuP46YQ07Vi8zPOmOhjVc=@vger.kernel.org
X-Received: by 2002:a17:907:7f8c:b0:c49:9247:9688 with SMTP id
 a640c23a62f3a-c49d1285bbcmr1316204266b.7.1793643653874; Mon, 02 Nov 2026
 10:20:53 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAHk-=wi_GuySe0L-uCAM2+nScCLYGBp5BLi6UUPR1gALmNM_3w@mail.gmail.com>
 <20261102094716.2c8b1cdd@pumpkin>
In-Reply-To: <20261102094716.2c8b1cdd@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 2 Nov 2026 10:20:35 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjx9EAO50CkadGadOA_ea0D7bBBmMbFfRqyf0OriZP+tQ@mail.gmail.com>
X-Gm-Features: AclHuK-Z4wjS1TnnNvVFXW9ibPlli2MU8fU3Akx6pwhQZSabsXf7hJO81Oq-TFA
Message-ID: <CAHk-=wjx9EAO50CkadGadOA_ea0D7bBBmMbFfRqyf0OriZP+tQ@mail.gmail.com>
Subject: Re: Speed up KConfig - fix hashtable confusion
To: David Laight <david.laight.linux@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Julian Braha <julianbraha@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Nov 2026 at 01:47, David Laight <david.laight.linux@gmail.com> wrote:
>
> An alternative would be:
>         ((key) * (u64)(size)) >> 32
> which avoids the division when size isn't a constant power of 2.

That's certainly cleaner

Not that it should matter - afaik the size is always a constant (it
comes from 'sizeof()'), and I would actually prefer it if
HASHTABLE_DECLARE and HASHTABLE_DEFINE took the number of *bits* (like
DECLARE_HASHTABLE() does for the kernel proper), and we'd just make it
a rule that it's always a power-of-2.

It already *is* always a power-of-two, and the old code used to make
it a slow modulus operation if it wasn't.

I'd also worry a tiny bit about what the compilers do on 32-bit
targets, although obviously hopefully (a) they'd optimize it to the
right 32-bit code rather than do 64-bit ops and (b) it's not like we
seriously care about 32-bit host builds anyway.

             Linus
