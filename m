Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9262EA749
	for <linux-kbuild@vger.kernel.org>; Fri, 28 Aug 2026 17:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787938549; cv=pass; b=Juy4zCZm6qu48Qr+1I2xjdPQixzpd/l8FfJwQ0iq2lWY9nbeoxJ1n2eP0K1v5OisRsL2+6isHRnVxZETY75caf4G4/SdWaUT6t9IVVpD2NfIvpMLzEXJORroc1MX7YxFAi+IFnwTa/U5PaqpIDqpr30UEkrPAtsrcCMxZKehAqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787938549; c=relaxed/simple;
	bh=QIwfG51FYqLbuC6hjumlOSKKDDgtiZ/qEfd/e4ujq2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d7rTu2KDJIMicX78CeOC/HxOeStZXxdumx3tGSl6rU8HYk1IrSc9RlpZEQhhs3CV46t6Hg40Y2Fd341cLlLAhE6kOknIA4b7u/Hwgt7kAUFjQOLGmu3nnKcr3Ufo6ElMwqpOlcqIVrgE1ZXvzsj1VoKuqtLtR4k+IZL9EwE2z+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJbBMiqf; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJbBMiqf"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ca5b707b78aso175017a12.0
        for <linux-kbuild@vger.kernel.org>; Fri, 28 Aug 2026 10:35:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787938547; cv=none;
        d=google.com; s=arc-20260327;
        b=pkFS7aYqaJqVrqdt5/a3tbM95C+9HuJSU/3izu2jIlwg86IYRzbhApi3J5sqz55Qqx
         +JiUh7K73YewcJ0/1NuXsvnxNnIPospVY2vEmS9wMOWru1S5v8zubAnAgHS/Y7/gmwxh
         q86ZyR28VH6J9o5XQylMQoS/ACpXekT+Qsiar1kRStMRDbEGumbT/KLNzyjuO3fwYJm/
         2McGYB+9odjxzONqEcG+GhewwRMKFmprHbUCYNLNgm+VwLte6Uj59vV2vCA7dIqACOGF
         kYcnJ8TZXkyMhLDDDoDsSZyeA9ttCPCnsbgY3+qAGSya8oCFjzOVNpRQFc3Y+CujeObR
         wu5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SwfxxVP2KSOMEoHgtysV+D41nPRKx7dyBiRUJMucGgE=;
        fh=uyfVQI+ehSk0rQzeoakwAtEqr5Ums2EeoVawjcI9YlU=;
        b=hbjPhIZH5AdIvqClheyTWQ7HoKwTumy3tdMpf1QI4IGNYHxjXwWPrWcq8c9YLzk00h
         +bKUmgExvXGBHDhfIJP6X8mn5s97Sr7jRx2rqFdUI5rxebLlORDn1i5Btt1dBb5SKopV
         3YsjnWfkoTzYFTeRlJttx9fi8CuuSKWTtg4WpyEftDZzvjEduYsOX6AqFyww8DIkqDkK
         kpuMSPCu4xkWaln2LKA7icjGtNtPqVB0bpW9+j5psexWOXn3kgm4m/x/+9mKcJf8he5w
         5aWYiX7AWgYX9q+uVbHo6oW2uZ4kpMhCBOWqYTBInsA46MvdnO9xDGityBNT1+45RT64
         i+eQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787938547; x=1788543347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SwfxxVP2KSOMEoHgtysV+D41nPRKx7dyBiRUJMucGgE=;
        b=cJbBMiqfnfAzijPJg52XSJhSdf6VBAoIXgQABBtFTXeL9RWB1Otgdfb53SbhWsdc/y
         8zL9XSz8jn+XcKsCDxmpUzB2J0s1aubLdWKgF79Ise6dKeevXJKQaWls37MweKlfuGmd
         gIlU7fZcHXoM+CQbeY/sRY5ah8e79mCRpUjoFtfe3kjiIhG6s0b30vPleJUSLoty/jrM
         YyDikunxgsG23Iuwt7jTR/k4cjWh11mCnPkcZ2Mkv1R0CdEyfXCaGdmzoQwAXK7UU5a6
         XLVxkQbLoc4IOfFq+rM0yupntWHQubwwPKJ9jFiNbQAPw6/AiwZpTzewPMaAxvFrg6GE
         HIRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787938547; x=1788543347;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SwfxxVP2KSOMEoHgtysV+D41nPRKx7dyBiRUJMucGgE=;
        b=o2YB65EDD9yFSEm2/Q5IwYR+g7DQ4UB2QX1l+YdZqtpWPOwH3nHWpkKNtkK3TFVk9N
         tjvjk9NDlFgu6MBQKX8OPstrvn/CvbzfYHhKNa9BIVrNLwvOY/NMgoRfFVwQYxstrojE
         565hAA7RCY08yMOTEWgoBKYroRJHS0xecCePZxbWvD+xXaSvhbQGYQHbRy7gJitxxrtt
         kJ243VpXGxewawoGYz/2xXQ1DZZOosl5AJ1ORrClSC3b5HvNaBE7iQ58Wvcow9J2Idkf
         aRTpHXGB3CyvWLQBpL0d4VDIIgU8jgib3vB9cAfEt3HThGn/bKxGy/bTiuTupGinB00I
         w15Q==
X-Forwarded-Encrypted: i=1; AKwUvBwDB3/XJE5eRpiphdxpt5l6edjalkS0vAf4Mc1yZh3n4IFQQ57X5vem0KeljffIz527X3hzX3e5yNO8k88=@vger.kernel.org
X-Gm-Message-State: AFuF++mg7TGFnYWPLDJPiaQo6oBvGNUOUJhN/P25xBfkiT7lhHOUmceC
	ZGzQVdI+VjApACbbCNAd0obp4VFrdXOCDIRkm0/T19S4mxQskVkUH4uiUiGZyHZOZyKjbK21pyF
	/5QEfrwliLpfXNtz9+wicj4L9rhKoC6A=
X-Gm-Gg: AYBFou2tpAtuSwtcPm65sGyfyONO/emqa3ZVFunl2bU/WnI8mRTgr+JJlceREIRRnv/
	D+MdDnV8nTcdk+FncoWO2AC6Iqy7snqg2nxPa5Va+Wn88BOsov/2tQqeZMjSU0ke1R2tqAaRgRv
	XaXRy2tviL+Q1fGCuEnDi9484spCFgtkiqPRpT8ZZntFVAc04Do/poJkT49vjkqaAmZwccMilva
	ALTpydGQS1sfvEWLuV5sMS/XkDJ6Eba6qCgCiSlMAJY7IAafXtALUWsiOXpAxupiQ+J350MtPau
	CW3CmmK7w/xLquALP/ok16g5oQnB3r9kg0Gp2nOXg7re0mJfoPC/zFqNxl/AWjmWq5PR2ocGk2L
	o7RVODqLnckY6m0DdcfWHpwJZ3FOWpYSjcOWQOk4V8jHBVUq5SI/BC31/uqY3XI8JijmCtw4=
X-Received: by 2002:a17:90b:3c0e:b0:395:4df3:8800 with SMTP id
 98e67ed59e1d1-396d0c0ab29mr8371730a91.0.1787938547204; Fri, 28 Aug 2026
 10:35:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7d8ba914cd174d716340bb2b88723bef0f330627.1787565460.git.gtucker@gtucker.io>
 <apG3hwaPA8f7SJeI@levanger> <b45e7864-928c-4b3c-aa62-64f4f63d85c7@gtucker.io>
In-Reply-To: <b45e7864-928c-4b3c-aa62-64f4f63d85c7@gtucker.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 28 Aug 2026 19:35:33 +0200
X-Gm-Features: AcwNN1WSwsVhEEVM3LRdqRtFMmDIpvaVESiQMW1HL_Bvm7itPlqfdlYEKO7mGmE
Message-ID: <CANiq72k6T9Y_Vubih6pFMQBxju2xQq0VQkCXT1WL0qSyCXKxyA@mail.gmail.com>
Subject: Re: [PATCH 1/2] scripts: add TOML config to container tool
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Nathan Chancellor <nathan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, linux-doc@vger.kernel.org, 
	workflows@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, automated-testing@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 7:25=E2=80=AFPM Guillaume Tucker <gtucker@gtucker.i=
o> wrote:
>
> It states Python 3.9 which was already older than the 3.10 minimum
> set when the container tool was merged.  Also my understanding is
> that it's not a hard requirement for all the kernel tools, only for
> building and producing a functioning kernel.  If I misunderstood this

I didn't check at the moment, but at least back when the "(optional)"
tag was removed, it was only required for certain configurations from
what I understand (I am not sure why the tag was removed).

In any case, it is nice if we could just say that it is required -- it
is quite useful to have around, especially due to its standard
library.

And regarding the minimum version, it would be nice to eventually have
a single minimum for all Python scripts, no? Debian oldstable is
already at 3.11, so I think we could perhaps bump the minimum already.
And Debian stable is 3.13, which from your list would be enough for
everything on your list, right? So we could perhaps set that as the
actual minimum for everything in the future.

Cheers,
Miguel
