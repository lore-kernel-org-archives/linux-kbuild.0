Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4377139936B
	for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2026 06:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781247396; cv=pass; b=SScHhdIyE1Ger2CCTSMid/pmOt6hqVnjrpZ7Jhr/u+PMdyOreZuv33NHSwGXTieKPxuIfrhxOqXpPIeugfLxr8F6UPV5Rdin8ziXBPnseHxzlMk1guLRK/vn5C2Vj3ej0lzdmd7hJOMlnrB+qT9pbMKM83d0jE68Xp5t0cN2JGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781247396; c=relaxed/simple;
	bh=3lBHS9HDKEcHXBILsrP2x1PQFt4q9srNsFjMrwfX9Vs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nMeMDeZwKHISJzKgzEkjWjY7zfxBQ1hEFYqte8YQJPpyMAL1d0CA/n63l09MxDVW7qpD8EeYCvJp7yJBY8DqHL/RSC8gVoW8uthmfpeJl2SRxs6a5+i7yErvGYTAsbmriAFUb0jewqUUfl+jgfNQMqODX616Cn1WJVtkrAP9ZYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EqDjjaIn; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EqDjjaIn"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6924a68e3f3so1109826a12.1
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Jun 2026 23:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781247393; cv=none;
        d=google.com; s=arc-20240605;
        b=XVrvN4r9Vve1YxZO1rqLpQUUOJ6KS3Dkw6K+duhkKX+OPTAn65lLFOenPLLufo+4lh
         nHkcDAKzIqTw1RE9OFjQM6IaIFbICSE+i/cxZzw29hdefB+VxRJdv7s7TJHISanoMJq4
         etoJm14ydYTQMYOwJAZlJTZFCHdeIUJzkCgyYKVRjXmftFXJUvDyOajayihjF3JmQHFS
         iETX7IBMW38zxwYbUoNvBXadcuHZwXEH0LLese1wFs5PSRvMtZyVYL3kcmhY0wm4BqU2
         oQrzcB9gyg23KGHxCqALD82ATQiQm7rw11M95shglXYdtjgjrLBEcNZoobsTkOjNS8sE
         BB+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3lBHS9HDKEcHXBILsrP2x1PQFt4q9srNsFjMrwfX9Vs=;
        fh=oPjFS3C9ZrChgJQhFr/rZwu5P4kkEScLPVLrXA91row=;
        b=IcGv/5E3Mchv8r+D9rgjjLgiBdkjaGV3fczWIB3cl3z8KJhHVO3gTeukLRVwejU0za
         AS6xcojcuZAR+v1BcNHcdaopWassDR4b9KROh0i4Ra8iQK8GQOSw7ENsYmTsxqrHjnRR
         sba24Lp/FEFHfO1je5S2sZEDpG/BDndBR+BijFrtFwBHJQ/r+1mfFS1XE2l1tPXNZETJ
         larEw9P30xSi/xsD20KuW1fCugUtVVqZ9zlnQtv+0p7Aavn85RWSFlTLXg8WMcx7IzHw
         l9fH0hapVwh3nsZvKW6e7Fz8JPc6otfS7kGwZpf+HF0vKJ27FbWfDlS3cJpzr8cynPZ2
         M0Gg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781247393; x=1781852193; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3lBHS9HDKEcHXBILsrP2x1PQFt4q9srNsFjMrwfX9Vs=;
        b=EqDjjaInov0ka4alN+yEFWBFuaxhdbrfTeM99dBjBHVH1TGqPNOwMXvp3aBAtkNwGy
         wuUszsiCnccC+mXgVgklYrmJpM4ITNLR+1Pdq81iYB9iH8fIQ4Bj7siJSio/GUKufXNx
         uXLplkNvuYKJ356p1ai5tl+9d3qggFzGRiMQ0Y85CiE+L3Q12ToW+x1COpZlQo+fpOZE
         Apr3vb1VXwL/9IHBFx3WjOH6ceWGtdi2t3QdLCyf1j21yuQZfrSPzo1HjsEevZyy96Wl
         FDOKchXplfC1MTsnyxN7ZPsFme7ZJTfu3QPEZC/sMXV7SCV1Jl+fh+kNG5QUGdXfpb45
         NfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781247393; x=1781852193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3lBHS9HDKEcHXBILsrP2x1PQFt4q9srNsFjMrwfX9Vs=;
        b=suesAPEnfI4M6kka/DDtQj5AHLpvLY7dewZkF66j4A11D5dPEWkulLcKxYWKtPyGLn
         /lSqvQwYVdbIyWCwaPwJ5XXRJpKawxYq2YDZbxd4xABt0/Q6kzRh7w6WnrW9zy7y9rop
         EOpAVbUDUFVWJlVMtYQoLbXn8x8zLdC76I2PgmwNgFTEsElHZqsizZrQTmgVV+q5NpE5
         HNadSuvoaxACa5A5mfpmJCekqot0j73T00aQdTMS1BhbsxNDSG1bHH14H6eVICY6Xrat
         bj40PTS+pCnC6Nc1ZGsm5aMGyeESgsjH0LQZHcstgP+jJFEzZk29s+RyIcRS6i6zWftK
         WmWw==
X-Forwarded-Encrypted: i=1; AFNElJ/QKUWcnKLD5YdSiAJ28cVBCEuuj4O2+T+ncreP3nTnqQZKnuW9gv71kzuwwOPELxO3EYMHQjXFlX5eojQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRttrx8h6qY8iAZ8rsA1iE68a4+SJntLapi6ByeIZYVCgnMKgi
	Dub1WN9GrdEhrfZ550611gm4Yizm8gVx7HNrWMYGWIf0FIGZzfogBWCvHly/eN8GPsoIXFWOo0i
	bUQQFC29dQmSJQ5O8o5gGk9uFac7k4WslBAwIWhPv
X-Gm-Gg: Acq92OGdHeGo9LRwt/edQHFxyWzWOHaf2hOIdvtgGf2g4IcYizF52n2Q1DBSUFbwQFu
	P2eU0Avhk7kskB/Xjv+pViocCGZzlCzIueDTrEWUaBRZurHZzLGsmuLhR60HWz5pM//YMTVa/3I
	PBEG0vsvM9PzFwLLEVF/4qZvqRCNae2Ejl/gTdOljsFqraTae5GB6qSnWn/8Y/5WYiguvUB/suL
	FojGSBb7hzjsUOJYNCJuDUH9aFfM9tdnFalQ1+IJX0arR1clYlphUfQfi91JC+R3GXsmC/SuUeE
	WPdiIF3I15LGTawEkB4UsXC56ktfZIzySZfvzQ==
X-Received: by 2002:a05:6402:434b:b0:68b:d10a:a48a with SMTP id
 4fb4d7f45d1cf-693784fb02dmr602313a12.11.1781247392123; Thu, 11 Jun 2026
 23:56:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611-b4-kcov-dataflow-v2-v2-0-0a261da3987c@est.tech> <20260611-b4-kcov-dataflow-v2-v2-2-0a261da3987c@est.tech>
In-Reply-To: <20260611-b4-kcov-dataflow-v2-v2-2-0a261da3987c@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 12 Jun 2026 08:55:54 +0200
X-Gm-Features: AVVi8CdLRn3HUIKr4oSFNxeMmeQ95IhSWpzIU1V25ylhb68DqGsVy-9EpMVuQUY
Message-ID: <CAG_fn=V1+_xLgCZgdLnT7Y-muRO0CXkrNKkC8AzrqzWoL4eR8w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 02/14] kcov: fix INIT_TRACK race in kcov_dataflow
To: Yunseong Kim <yunseong.kim@est.tech>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>, 
	sashiko-bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 6:21=E2=80=AFPM Yunseong Kim <yunseong.kim@est.tech=
> wrote:
>
> Two threads calling KCOV_DF_INIT_TRACK concurrently could both observe
> df->area =3D=3D NULL, drop the lock to allocate, and then both assign the=
ir
> allocation to df->area, leaking one buffer.
>
> Fix by rechecking df->area after re-acquiring the lock. If another
> thread won the race, free the allocation and return -EBUSY. This
> matches the pattern used by KCOV_INIT_TRACE in kernel/kcov.c.
>
> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260603-kcov-dataflow-next-202606=
03-v2-0-fee0939de2c4%40est.tech
> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>

Can we please avoid this?
kcov_dataflow.c is being introduced in the same series, there is no
need to send a buggy commit and a follow-up fix - just squash the two
together and note the changes after Signed-off-by: separated by a
triple dash.
