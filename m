Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793466614;
	b=eB8m02ZeeISsgb68RXKzwDHiuZ7/Jebv2nG5JEwgI2BLBSYT2xQhbLVY2V7zYroRFUNZ
	 20SGeILbsqsdZxB7+xi1tRUveWkQN+MXrZkMV8IRxAK3XrIbkd4Dh1c8W7w1uro9twJvE
	 mlZPiUXnpwemhLNSKUc+RK9dokWlC74ZhuArg7mflIdBe9OL+PJ4P6AVJMi6cMqY+rE63
	 sY45EM+Z7+3bj0ZD28VqXUOu+3AMV/GkZjQ6pe01DvFWTdfrA0HLGikoQM+QCaPgfhOJz
	 7p93/1JlOOYbeywHndnPEmowyNAh7Xq30PlUis0Mis0Lm1p3orj+N1jK8s7aydf/L7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793466614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=S02zFKQTw98qLAlbNryreV97fiHHWFWx7ndQG3y57t8=;
	b=0n/rfxzwFZeMKf/4EzisIEikSAwYNWlTYJxsYqgj4ncRHcyEjfS8Unpa/EriSt8Ri8M8
	 19GHB5RF0ZVXjMebLfELQzQm8+vxjjnyGSKbd9/qBGtUYSn3HUN6msIUotY8igOC7NA2V
	 E+WChEz6mtXtJ/O4ib/b560ZnqVeULoUAsyezpxI3Gx+cLh2pkoou/YP9yeCa6+/Ro3k7
	 8vqF23RmJqyNAtHV8hxEkwKkQvmClZn8Am7mqWpV4gYwLyCp5DWwRL1OgmJuYSque4G+k
	 krEeFoHkssC0L2UEKZUVWrqiXzXpR814FGSQYipu8dv8wwPjbpjCljmexscXQNOnm6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zAlQpn7V;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DAD606A327
	for <linux-kbuild@vger.kernel.org>; Sat, 31 Oct 2026 17:10:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68DAD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zAlQpn7V
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso1090910a91.3
        for <linux-kbuild@vger.kernel.org>; Sat, 31 Oct 2026 10:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793466609; x=1794071409; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S02zFKQTw98qLAlbNryreV97fiHHWFWx7ndQG3y57t8=;
        b=zAlQpn7V5Yxzz3a/EooOjbQS76Q6xQ0YpJEIcGp4YzdScOrPhhAvrUur4/FQHYJqRA
         8zfHghpz6jXKETFWCpI+22lxZ4tiU8Y1Wc2I1LGCzNcA48QIfHM0NthCxotitdxVloRD
         7jW5L//FxVzW4EuToHyaxOBM6p67ZQEXBbXMiVGM13bEtgPc/LRBcWVgFZo7OtjjXbae
         x38X4P6bQH9CmqpDSl/U0Gq7hPzrHgec0DsPUl+NFmdA/2pRimxjub456nrjYLulRtoc
         kY3kMmeFOtp3fe5XwkcAgy2f09rE2oqb/7WSkbZ5wd7smSeRqi0JaRIl0JBf3GPVA6ml
         lPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793466609; x=1794071409;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S02zFKQTw98qLAlbNryreV97fiHHWFWx7ndQG3y57t8=;
        b=p26ZatjcXznFlFz3FazeQhh06E7ntgrT9WAWGfh4y+CCpr+YQh00MpaTwQ6AESPzxp
         +HBI7PLV7v2MjeBdTDlSLGx2ga9G3P2ZbWvqLEd0U0rFZu+WsmLVyP3PqwpbIyWwfq7E
         OWUcDyLRKLOeLL9HwHqIBTqul6t4q/IbMws5eClrTES0E2+2vdv3Q4lQVhiBGT7l7CAx
         K/eSdMs3euxKkV+zOPk1ngXO+TslU2Bd+IhNzozt136fbVt1E8BURxRsAkpX8fVtyF3e
         LMggrGEUk0mFJXe/R1KNygu5DTp3rBczk6XP5kNy8l1XpdvOseuqpLDD4siRVFSsnpd/
         sEAw==
X-Forwarded-Encrypted: i=1; AKwUvBzCdRAiv6cRH2LHkmoDcDnuohw9fuAJCpQ/7wUhlXw/AZNqj1ANuavNnK+spcXdsfVsmWbR4AZh7f/iWfc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJO//BPOr2zZxnz3VpoNso8d/5PfSOXSNXjgfXxQoraMffDQ9dz
	fojk1tGSfHDmx0b5D34aexLty8nb9h7fP1TtgvBlCqrPlJz2scfePfr6
X-Gm-Gg: AYBFou0+NKzi+GYLaGlE3nkZAOWl6FAH2MIMYeNAKNo9oH5Q3AIPrZEhr35QzUMjV38
	pmIV2O4auFGiKJvqiOLMu20cHib2Cc7pQN8BtEIwR+5mgTCFCMx63wYNY3YCmXj/AIjD9kK/s/h
	wVJThB5k/yrucvk0c3d4Fj/z+ocNnZtm4/v2aH5jB3DaQQORtce7qesPYv47JVIMXMVxfctq7IY
	/teXLND+Pj/J8NK58KMqE8YPGEooTIeudEor1rCn9i0xHwMfARK1ltIo6zrj26IaZ0knjytTESC
	6I3FICwDxoG9p6mBTs8sWmh3pPp6rghlmaG1S8KXAsq6vc6iq34Ez8l6HTIJX95FbWGsQAVKly9
	c7g03udGmlJrW7q8CQ/tXVa882ofGSDZVHo433uNOvrxEAOWiS2zrdzEUFnWfp2ENiWAnct6tXd
	M8ijG106SHaoYC6CGSzmM6qxZXrqGPzJwb/gZvoD1RAA4j91lsgYts43UIYc21vIDjMUre0qhZF
	iU8igy6e5TRXuBiQlxfna678fWQYiTemlvQkqBvb4h6ALzATaHMqerUV2mDPPC9lBIYbIcZjeDv
	YlTNayQR66Qr1LOvdwspGTcQ0t+WK7g0f6dCfVFxfW3AjQyPdMUuRQ7iaZ24lMArO3nHRgU3qHH
	rUUhpdbAlB9drEQuODqtXEORYed2tFPHm2w==
X-Received: by 2002:a17:90b:1a8b:b0:3ac:9e76:aa76 with SMTP id 98e67ed59e1d1-3ae8970fd9dmr5106038a91.13.1793466608564;
        Sat, 31 Oct 2026 10:10:08 -0700 (PDT)
Received: from localhost ([153.61.198.255])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845df666sm8093713a91.14.2026.10.31.10.10.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 10:10:08 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Oct 2026 17:10:07 +0000
Message-Id: <DMJ6UP7FV1X1.2E7I2ILPBS34P@gmail.com>
Cc: <ihor.solodrai@linux.dev>, <almagui@kernel.org>, <martin.lau@linux.dev>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <rostedt@goodmis.org>,
 <mhiramat@kernel.org>, <mathieu.desnoyers@efficios.com>,
 <linux-trace-kernel@vger.kernel.org>, <nathan@kernel.org>,
 <nsc@kernel.org>, <linux-kbuild@vger.kernel.org>, <arnd@arndb.de>,
 <linux-arch@vger.kernel.org>, <x86@kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <abuehaze@amazon.com>, <doebel@amazon.de>, <mpohlack@amazon.de>,
 <jay.wang.upstream@gmail.com>, <martin.lau@kernel.org>, <mason@kernel.org>
Subject: Re: [PATCH bpf-next 11/13] bpf: keep module BTF until the vmlinux
 BTF is parsed
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <bot+bpf-ci@kernel.org>, <wanjay@amazon.com>, <bpf@vger.kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <memxor@gmail.com>
In-Reply-To: <df56aa51cd704ab9a9b03d3574e6ab4c61d5e6d4cdddc17f4b0253f67cc077da@mail.kernel.org>
References: <20261031130959.23472-12-wanjay@amazon.com> <df56aa51cd704ab9a9b03d3574e6ab4c61d5e6d4cdddc17f4b0253f67cc077da@mail.kernel.org>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sat, Oct 31, 2026 at 06:55 AM bot+bpf-ci@kernel.org <bot+bpf-ci@kernel.org> wrote:
>> +/* Undo btf_parse_kept_modules() of a round that is not published */
>> +static void btf_unparse_kept_modules(void)
>> +{
> [ ... ]
>> +		btf_mod->btf->data = NULL;	/* the kept copy */
>> +		btf_put(btf_mod->btf);
>> +		btf_mod->btf = NULL;
>> +	}
>> +}
[...]
> Can a module BTF that is rolled back by btf_unparse_kept_modules() still be
> reachable through btf_idr?

Yes. It's real. The NULL deref in the inline BTF is real too.

This is quite heavy. As you can see both bots poked plenty of holes.
Five of them are in the -ENOMEM rollback of patches 10 and 11:

  where                        what goes wrong
  ---------------------------  -------------------------------------------
  btf_get_fd_by_id()           takes a ref on a BTF that is rolled back
  btf_free_rcu()               reads btf_mod->data that rmmod freed
  btf_parse_kept_modules()     -ENOMEM in the inline BTF removes its file
  bpf_struct_ops_desc_init()   -ENOMEM of ->init() becomes -EINVAL
  btf_vmlinux_data()           -ENOMEM without btf_zst repeats forever

The rollback exists because vmalloc() gives up when the task is killed.

can we run the parse from a work item, schedule_work() + flush_work() ?
A kworker gets no signals, so -ENOMEM can be final, like without the
option. Every parse then ends in smp_store_release(&btf_vmlinux), and
btf_get_fd_by_id() sleeps on btf_vmlinux_lock until that.
Then no need for the retry, btf_unparse_kept_modules(), the 2nd call
of ->init(), etc.

See my other reply.

pw-bot: cr
