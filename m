Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13D24B1B26
	for <linux-kbuild@vger.kernel.org>; Sat, 10 Oct 2026 18:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791658163; cv=pass; b=cJ4cgJN2FtlzzUAsgLZuVG9q12evIrjnefffrXNtWBkkeoGHINGx9JQK9uJhiuxxS35aJNNpuKF9GLf74KS4LtClbvDsBEnjMVgqZO0/L7XsyeF4L4WoASq175hetlJKdKq8LusA0Tem+dd1Phl1ZZ0ZUPke4krcFGVnjxnuv5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791658163; c=relaxed/simple;
	bh=oQPmF2vNcsU+aqyGKsT8E36dPC78v/n+IE9l6gTjd8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IsHXKQltBmPqp6wGuYZKnadF5OKnsUQCAkD1u4LJTmTDRSKnEScRFAmm2ag0d140Dd+RwGjx/4iiBlyMBCsxV/qyhCWdJc1BfSS3ZJ7Q4ChxRfpFpCaIgLuiq10fFS6XOtr0KV/V+AMkWU+iBOop6wy7nz9eHbQxxuOS4Ok0+kY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vNif0Xbk; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vNif0Xbk"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6aae147ef9dso3377a12.0
        for <linux-kbuild@vger.kernel.org>; Sat, 10 Oct 2026 11:49:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791658160; cv=none;
        d=google.com; s=arc-20260327;
        b=FsiJTMMg9WZ7YjY6ovZFDQ7YYQk97TP7eurDayXm3kZjWI5N1oxJcEjZWEA+MA/kzX
         bvFbhskT/v4moMWO9eh1xreXF1NFa3XbR2n+FG2pPBQ/DjU+dWzX30v9GoS0euUcnXB7
         hhiQt7zIDoCTeKjdu1l3kjCGEERFIKfbrR8Mj49ZjaGeF5rlJre7X0t+F8xLQbw8IbcC
         mdRavEI0T8uGngv/MRLH6GdFR+iBY7NTiA0k+tEoEEAGLPWHDZWZsF5ZTRAishhEkvpp
         gIDUr7EfYKw7bof1Jihphstut6CRBz8hIMVyaw/kjgUBqRbwRPCqSG0zkNXR1DsV943/
         2OLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xzViJlfng9ygGmV1Zx8fkcrOlZMfym9liXR+dzM/BZk=;
        fh=P1YpP8AiMNlhCTonnS8c89VQiH/sAA1u+gO0x/uLt7k=;
        b=Qklq97KEpFltRo4MB9d6ju7xTgrIrWnH2tVpCTEmxNRzYzJGPSSNrC4vFzYS9HTwYT
         jgxmUl5E6bxC4ytbNfw9K0rUusYKB8EdgqGxjHTaKGIfnCD7t+xy4a/YbMhAv+kMSnKh
         /biIb2fEZEPFKlYCy55E2h1YfvqqHbn+IlsgSVRibKriTndYKMok4ujO8wu6DEeG4bCU
         7dIbi231N1MPXDaW5iSIhT7w4wPv90TIoC15gcHCFcoFKEbvAggAQJdYyJLHnx5SEhCC
         NzYhiR73I+cD3hmQAkGcsft9bqzQB6eVGtCL+Vd/1cMuls8bUYGAMtO1wWnRzCLaMLeR
         IAGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791658160; x=1792262960; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xzViJlfng9ygGmV1Zx8fkcrOlZMfym9liXR+dzM/BZk=;
        b=vNif0Xbk1nyC3c4axvE1CoamGdAPXFFPzrZhNjDoYcg1/aSfKNvCLiD+h4OqW+7s2p
         GTbPfKFXiRvBzsR9R0RRc02NIvpaBWRZ//WMhjL3Oi+peSgVU2biWOkW1ISjxnxqdUXe
         uxCnhnAs5syacwy/6GpLkPB4JG1sHcVc6AZkJlYrcGC2I1Twp7A9XTpj+82errnK0I0m
         gp5qkAZ1tqmw+TbRXkz9zhnv8EBv0YlTj8JaxXa9mZwKmK2gDnhKJtpkvzhxjHslQ2U4
         x0rGpTGZpq9rR62LDYgHdujWcqBBFbVe6gHdM3yZ5440pk+HO5T1GpzySjbaXdiyN8V+
         5Ysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791658160; x=1792262960;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xzViJlfng9ygGmV1Zx8fkcrOlZMfym9liXR+dzM/BZk=;
        b=CDiqy+5VZq90PXMEt4WePuTED7tK6n5/4gVVxJdI9zIl8n9XDDxCF4w+HkbXjAII0o
         nrUXv775S47MiLv+spy8Ozqb0THnTcVECA5AJvdgLpDxgMo+ptmkOpsjx9z32NJNHMZc
         ZlUqzTGNMvdrE9LHlbjIUmFBGxfG70exDIj8CUNvfJ+lapzvWu1tGyZ6YM+Wzav+g5W7
         TY2lQZuVifDPpqxp8v04rLbFftJlx2oRs2i7Fc/1Bidqwr7F0CjjgS87ozCHKF/hg01V
         V3hFKTaNuxpCzNcbwGgexdW7jRrlJwzY7rmlNJcbtp9+CIc4Z4vXs5lOUf4L/Yi1CtYz
         F6CQ==
X-Forwarded-Encrypted: i=1; AKwUvBxv1b/MYwAgNz0d9J5EKhc2Tm+JtGhukSzAxFVJpMT8o8dhWs4MnMui4Ty3P0zcbzwaN7coDYhjOYnqs34=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQQE3fsHGAP4cGcSt+347YpNnmHf4P8+ewFG2eWBMPOkFlzDZs
	Vp0O3zVrj5Ur+F5n+ck3PeJnjp8wJsD+1MzJcbP2m9Bvi8XLe02rpXG17osdTa+NbibD1RflUlq
	Quj4GnzJHmQM5yTP/aYBvRGFq/q53srNxRUzTDoc2
X-Gm-Gg: AYBFou0wHFgC4xaeE375MnDOjT+QnObAOl3pfPC+cD8De0yQXsPyJYcL5ivhOz/RbN9
	KGJrDiTzz9RPbijuxjIRAjvs1k2aRHSgY1skQHQkf7BNrHa78ZQx7bR939OBnXrxkUptyZ99xW9
	WTBcVT6+1ElrxVMWXgu82v2dzirJ4Whlvk/eZHfbJ/6CFqI9iBz4JFAuk+k2kc80iORKwU3ApSh
	y91GBGOIFvaLIJCGeMQP1N8HyPmHP/CAtrTwlWJjLhnWuyqMb6l9yQZalEoY1BJ5jw5zGdpwTkL
	aabMxwT/SmYzxG2em4A7OICCloOlJk1eV4ukdU0+3reJ7UzbI3TsLA==
X-Received: by 2002:a05:6402:2082:10b0:69c:39f5:7e36 with SMTP id
 4fb4d7f45d1cf-6b19876fb1dmr15796a12.0.1791658159479; Sat, 10 Oct 2026
 11:49:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009214501.GA905361@ax162> <CAF1bQ=Qq66JuvYrbR-7GgegZuWPSjxDOgerUSD2NOp9W0BauZw@mail.gmail.com>
In-Reply-To: <CAF1bQ=Qq66JuvYrbR-7GgegZuWPSjxDOgerUSD2NOp9W0BauZw@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Sat, 10 Oct 2026 20:49:08 +0200
X-Gm-Features: AclHuK-ozuuUaiksMjkRlpS60NF8BtTRb-Oo-GWjNU3407m-ON6-M4dsU8PWDMA
Message-ID: <CAF1bQ=TcBqvu7v5fXK0xkf=ak=APt_i0aXCtTSM1MZiOvQqoQw@mail.gmail.com>
Subject: Re: Build breakage from renamed '-split-machine-functions' plugin option
To: Nathan Chancellor <nathan@kernel.org>
Cc: Han Shen <shenhan@google.com>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry that if you receive duplicated email.



Thanks,

-Rong


On Sat, Oct 10, 2026 at 8:46=E2=80=AFPM Rong Xu <xur@google.com> wrote:
>
> Hi Nathan,
>
> Thanks for bringing this to our attention. We will need to rename the opt=
ion accordingly.
>
> We need this option for ThinLTO (though not distributed ThinLTO). During =
a ThinLTO build, LD is called directly when building vmlinux.o, so the Clan=
g driver change will not apply in this case.
>
> Please note that I am currently on vacation and may be slow to respond.
>
> Thanks,
>
> -Rong
>
>
> On Fri, Oct 9, 2026 at 11:45=E2=80=AFPM Nathan Chancellor <nathan@kernel.=
org> wrote:
>>
>> Hi Rong and Han,
>>
>> LLVM recently landed a commit renaming the '-split-machine-functions'
>> plugin option to '-function-splitting=3Dall':
>>
>>   https://github.com/llvm/llvm-project/commit/3e6acc87c58843e551d6e8e4bf=
06c26712b04622
>>
>> This breaks builds with CONFIG_AUTOFDO and CONFIG_LTO_CLANG_THIN with:
>>
>>   ld.lld: error: -plugin-opt=3D-: ld.lld: Unknown command line argument =
'-split-machine-functions'.  Try: 'ld.lld --help'
>>
>> Obviously, we can handle this rename but I noticed that the combination
>> of '-flto -fsplit-machine-functions' should add the corresponding
>> '-plugin-opt=3D' since LLVM 15:
>>
>>   https://github.com/llvm/llvm-project/commit/72acd042bad35f78232f17addc=
02196a7af1a6e9
>>
>> So is this even necessary? Should we just remove
>>
>>   KBUILD_LDFLAGS +=3D -plugin-opt=3D-split-machine-functions
>>
>> from scripts/Makefile.autofdo and rely on '-fsplit-machine-functions' to
>> do the right thing or am I missing something here?
>>
>> --
>> Cheers,
>> Nathan
