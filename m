Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.221.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793918452;
	b=4JO/ccwZrdpyr7TaWoDTmxIncTO+P9FZqA6HTGbqK2qfMUv11avPpb82TKBs987ar7+/
	 inKG5FPMWzhjkYTvQvI137que8NcF7NpZ5Pddno40R57es8vefFZ4BxZFuL7pOqHHuTyH
	 Tp4lOKeJCvlr8ZIwxdiEHCAIJI3QkrqRSIvmLDUsLu1Ux84XY5t89JmSTLIAW1gnqfi3s
	 UA+fHjanX6K6q8oYrBTwitvMHeogY2VhJWNUwJM9yE+CCGk+Eemfo6Ei0FsytmzpHHr3v
	 kTSBIpy0cuwupxRSn85CMwCvRXZzDclI7q7arhJOKwHP5ZQm4z1Jx1IvgUwl3qQ2QKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793918452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=asv4QJYvubkejzKdluXiY+GI6RaigE/KTwLx8Jj692M=;
	b=fkjjnKeNinVP5HEgg+cQdfxhHsppJbu4nivICsLfh7YSnovZj1m/jHh42ZF3K6xcEHsb
	 EsqEIPhiUqfxS8fBhhvdo+P8SmrNoSjuK4lIntImSpZT9v1NyN0ubHlGCb5P5S0/YLKk/
	 xqKLqp98flUOYRGkzVXTN5oKH8jEK+JXW7hfov58UofY0yIxVnJg8ZISAP8NNrOfQ6acN
	 hZTRSDQBL/Mm0WXiVCRGRpPOenfUEUkp+zO8bJUJMZOs+gEwNOxO6IyxOjKE6NEclcb9X
	 6JmgFhJQrBO8TNJACCRwnepQxTMxH0CDRZBE2oLVzSDUE+Y+kTNE1j4mrJuDrgZtmiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RgLRNkQL;
	arc=fail smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F75606A329
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Nov 2026 22:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3F75606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RgLRNkQL
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48df4f540ebso34035f8f.3
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Nov 2026 14:40:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793918450; cv=none;
        d=google.com; s=arc-20260327;
        b=NFpHJRC9Dy+w+YzUkvCL8zuMn05egEI0MsPPIznVz/4wRvzZ7IPzOGtbPGGOtwyGG8
         fvi+7Wh1LjLkpT0I2FArc3EZDtWT6f3Dn13MFrZh/PGDD8XIWI9XHcZ1ECjBqp5g0czJ
         8T3QLLyiAfxRNkgAXhuyBE2YOr04RgVkbZjBxsVF2yQL+Phhld/PmA31pA1wIfeMbNSk
         3naKoDhJR4EZ+VsAhekFSp5USmj/hvTUaUFt8DDvuBhw10opviAaRJZp86uFgfK4Gukp
         mxH/T/8mKd/54GI68VZHYwNz18KmZgjhlYdVEQAiB3vBzdXZWn+6fG4bZ+FYMUpsMpgZ
         7iag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=asv4QJYvubkejzKdluXiY+GI6RaigE/KTwLx8Jj692M=;
        fh=biI61PU8G9cuv/3ZNCWlVCxJ5gb2kVlFcS/kA52vKlM=;
        b=HpdiRQ/dix28mFvJDc+reuy97+YSo2hOOCwnET/Ygiz7O5pAm9NZ/2IURke3wSqoYM
         y7B3p4CyIE5mDijOFXPlpVYrJ3xAU4a0AbzxhoRxa7eKFC1xy2dCgFKsNiat+nVExVY7
         7Jnb106eg1jdBR7+tgZXKbN2+ZH4ix7WV8HbHQJ3D01CjS+KK8J3ZIovlZFYryUFCyhY
         vmYRnIAOmaNhSwZwHnAvsQD0AJzLNjFqEeiZ4O9eqoAAWu1g7sJl1tNMkqg4uQVxjYfQ
         7n8iXtRyUePSU/kpJFISVcqFj3M0d1c9eqQk+AH+tjBvwmNkx5Ziw0uPmPhQHrEGEiCX
         A8UA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793918450; x=1794523250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=asv4QJYvubkejzKdluXiY+GI6RaigE/KTwLx8Jj692M=;
        b=RgLRNkQLo0+/Ugi8UZpgCB1l8VFl7ffRroxPbtHZ4YNEaKqjtzdw7GXwpZ1DXMUZDd
         FRDGAJf01FCLY2PbU1tVMy/K3opwjWIfrABgQrTz/H2e2O3L+5KxKMH8RUCCXT1VWgqT
         fUE9YKkZE25MM7dhJkEVEvn/hvChYgKruV+t4R5688c/h7bue49V3bjhP3vk5/VKhqYr
         OG0Uo42RD11B7RfTJN7AkVa6Jh/9MB74t+PGjKFy3Y/CSzhdMvL81tSxt3YnMscfprrM
         EdfMixRG/B6d76i+GAjV2xzW9bHlMrNTFMx/HBn4rH17iBxMGSeQBhzc7bhHA/NL3rfV
         oEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793918450; x=1794523250;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=asv4QJYvubkejzKdluXiY+GI6RaigE/KTwLx8Jj692M=;
        b=dHdZn6jZ4dLXpwImVhA8Hc8yeyc++F3hGUHb0KUb9pIdMmWAISb94stJ44djcAcxnu
         +KNlUWY/X386iJFihv0SULPxWAlpR9GGoriWvxUnR2tjbe7Yk5tJlWZt0rbO6+H/2/T3
         ryAujlArOd7vuJxRtiAaZOquLrMXKTsxtNF+fbF774ZWtBu3HUi489J1VxYF7j8OyPZB
         omuOLDiUcHByRbigQ+sM6DcGwApmpiKJD3OLspgz+u3X45ihMzhnHP5IulpkOp36C1EN
         XJA5weef7M0SPO2odntooyaXqP/TFJ4p/tBcwBc42XJ2KXqIWAKjLgPoIGTt0tbAUSgr
         F6ug==
X-Forwarded-Encrypted: i=1; AKwUvBwC/4UNEYb+Zomr7Tz+lPcelHgc0QRcXnSZbPKepXLY37ySRJHR4PmEHjhzdaHvfd+oOWWHdXQruB9eqa8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vBJ9uX9bwaP7wx6J5Y5DAPrcTgwragStSUnCKHFtKoy53Wsgo
	yn+UeHXLx58RwppVALRTTKLpwz+HB6PmaNLainKTYNBzppcN7igViapLZHjWD4OsrlYc51+NUps
	vBJlcd7p80K2lKusOrZWRZ0w7yn7kn7Js5fb/V9EN
X-Gm-Gg: AYBFou2egy/fRd7/d3bzrFCcbLeJ3ATnss9rFJUWCRI8rM7gzAv0Nj4JcoFYk2pVHEW
	TFzAYjGGLOtZMuUGETySbkdFsIAWou6a54FH6IVfsS1rzV56nfcnCa1RehGAPyLaEQVEZuY8Yg9
	ZNYJS0ctMX5rGf7qG2CBt0vuR9ymbpHLjTZOeO4Ctmx2j5pD1x6g5FHxXyU90i/Q/4ynDE+FolS
	6FOSzoR4491jXAZohDWi2wwgbl+5j3q7Sx4ze3qC4npqadg8r5+8dnxbk3N+FMtIa9ZuShRJnPQ
	nZspvVmopFKN0006zFdpoFY7SSRAwYxG/Rfk9qZSOSs/kkuHqbOWJsd9Iw146qPrXW+YiEpycc8
	4E3nus3WJ9ziTqCfFFFqW6xt0Su7atoba58Xp1k2eF54I+GFHbIkIj+Vu/scHXz8E3I9bfOo98j
	edQPjlCokZTxNFJllipS6MNd3SnkC8/1UCJVXgqovZFCyX1CsAs/rMICEb57Zs17Q0tPAB9B8cT
	9WffriAm/0a6st/PLkudiwmgf038Ke3LjbCAYY5tNObL3YVvTy/Qz1iww==
X-Received: by 2002:a05:6000:2892:b0:48e:d27:bef2 with SMTP id
 ffacd0b85a97d-49276a6e26fmr1759258f8f.21.1793918449566; Thu, 05 Nov 2026
 14:40:49 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104174554.1.I8556199ea4f1335169ce16e97309aa63ae2e2310@changeid>
 <20261105052401.GA862715@ax162> <CAD=FV=Vx4gHvF0TegRBwZetTNjP5AsjbBK9+sjNA43OpL1Wjiw@mail.gmail.com>
 <CAF1bQ=S52KWHopqxksctbBirFEr5Mz1dKKMAoWh-dqLHii3Nig@mail.gmail.com> <CAD=FV=XE+KuTDCa3cLOsHPfQ9ngFOXrokFbxr=jDm_UFwKdQDQ@mail.gmail.com>
In-Reply-To: <CAD=FV=XE+KuTDCa3cLOsHPfQ9ngFOXrokFbxr=jDm_UFwKdQDQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 5 Nov 2026 14:40:38 -0800
X-Gm-Features: AclHuK8nvrGQbL7-Xvq-JpHEYtxPKFX5Sm9KyXUfS9U3lydEUDZDAqeaU6dAk_8
Message-ID: <CAKwvOdkNvYz7mSmfQzWuFd7FZEUyZkH0L2tfPSbouE0J2w=b1g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Doug Anderson <dianders@chromium.org>
Cc: Rong Xu <xur@google.com>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, Han Shen <shenhan@google.com>, 
	Nicolas Schier <nsc@kernel.org>, Han Wang <nesthanwang@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Bill Wendling <morbo@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 1:30=E2=80=AFPM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Thu, Nov 5, 2026 at 10:23=E2=80=AFAM Rong Xu <xur@google.com> wrote:
> >
> > The issue you mentioned regarding excessive time in applyFlowInference
> > comes from Profi.
> >
> > The AutoFDO implementation used in the kernel is FS-AFDO (which uses
> > FS discriminators). There are known issues when using Profi with
> > FS-AFDO; enabling Profi actually degrades performance compared to
> > original profile propagation. When we tested and worked on AutoFDO for
> > the kernel, we did not enable Profi.
> >
> > While I haven't looked into this specific bug yet and am unsure if it
> > is unique to FS-AFDO, I recommend using -fno-sample-profile-use-profi
> > to disable Profi for now.
>
> Interesting. I can suggest that to the team digging into it and see if
> it solves the problem. My AI agent says it will though. It claims that
> the default flipped recently and "-fno-sample-profile-use-profi" will

I wonder who flipped the default? Perhaps they're not aware of _all_
of the existing users of AutoFDO, such as the Linux kernel.

> restore the old (tested) behavior.
>
> Should I send a patch adding that flag?

--=20
Thanks,
~Nick Desaulniers
