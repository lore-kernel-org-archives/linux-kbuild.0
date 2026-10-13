Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D503D1CB2
	for <linux-kbuild@vger.kernel.org>; Tue, 13 Oct 2026 10:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886207; cv=none; b=FolKKk//THqHtlRI2GOVFnEgcIBxuyVbsOqFbrBkrIFLGe/SfHgXykrTxwXmkT894+FllANUKsELGEyjVG9hFtCtU4WdUUu4A9Ilfu9ar61zcWHxJP4ps2EARTLEfSbqCLRo3h0sIlIx/x32PcwyJPmC1ziiO9KHaoDq9FJbw4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886207; c=relaxed/simple;
	bh=wx1YOW8KjXNuf+3dwHeKK50OdpSvPEga59yBXcRepkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qaZ8CppxI3PCG1kt/KIylGpjS3CbJzXWkUxYr8V96URipUXayMXoILWUziY1zXQm1NN/0lq4zRFTpKzg4DgxAMqLi15NCjwWjJk53dz2/50j0Frz2MYw9BOpqaIGdwEAScp+EDOFWoquesxgW25H4nX3hsPqSS4Qxa1PfyoPAiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l1K6GBq0; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l1K6GBq0"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c20ce3c118aso332162866b.0
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Oct 2026 03:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791886203; x=1792491003; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LzdhV9lB9qXueovv0WwaiOHszHStN4aVPEcvSiAOmLE=;
        b=l1K6GBq0UkNEm/tTOZqs50Uj4F8fYlTGnOJCudGEnuWEOZzxmnarLD6HtVCelfgjQn
         JD1kr1mltkKl0NJNzmj83kzhuvIjGBiBDWv8nqEbBlmY/9/cSMQkhn+B2FJafdJfsCVE
         aSlFwH72dz3dlQzX6QukWa7mOjQ6YMvsozCrwY4b8M0IGnoYusU+zpilKWFKzZ75DCNl
         MF6XpjCX2l1B7QVhbNXFPBWUR5D1pxVjT8as4VxbHDJW/kIHQoQtZFQetBlWdMmQeyPI
         HzOv2hGE1hf0Zwbqn7UAVScJxkqkdaQOez2PylJC4zIt1/CsXmrBVnaLuja5mD47v0SQ
         6eQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886203; x=1792491003;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LzdhV9lB9qXueovv0WwaiOHszHStN4aVPEcvSiAOmLE=;
        b=ERA6Ilf57nSeLhY9zNLW9FHLq8HF1j0rhj8NYuhJRp564KFX2PrB1AGP5W2abuAptX
         pORjylLMQwmk/JOOBbUCYK4pq556LDPSu6D23RENSPTEzOZmO+mEIEl6hlZ7WkpV22/m
         3idXUfI/Y7KGIHeA+n18Mv9/IaweoZE9weEd8nOsfqGI9QqBbobEIabhpUPqtVblWOVc
         UfW/j0tn38/9f85jA5wqwEoZbH9Fbze1XxW6Go64T5d9QVW0LEJw1wjGWgUEP7OX+Ga5
         HbQwidYSlRNbVw5zuIRhSolwTQUPm/gge6O9nISBFxaY/asPkEOB38z+J5etE0bxOIZE
         Ddlw==
X-Forwarded-Encrypted: i=1; AKwUvBxfYbnULlOJ2CGbFQA+JjTsfRb09CilhYNm1LDub+1jwCnMOtIZBhkSTjw75EW/Oo0+vwAF4dWH3mDtGBU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyk2/jSzZmyu4kRn0J5aE/D+9i/6ZSX2mcm8v10i8EVQ+ZV2uD
	GzRMoN7Qcmnn8WjFf3WN77GAmC8JxhggdoCQRanTw11s17GmIOBmPjzv/l23JPCh8Q==
X-Gm-Gg: AYBFou2nyZDX2+wSufC2M3a/ZE7oulgatkFlp6VOjnfciIzQe05J/ZxXsV+TS1Y4wRf
	EUTZQN43czBd9vwvSw+2OKuLC412rsZFL7qqNRccp/jTMx+vZQqIFRhAxZvF7h5MdvLPWbUKxb0
	9ZhjmZVhcmyK+FeX4HkttlfkzKTgmmBvfUIhDWRXkhYdrhFz/bwZJRucrLcPRNtJvmwxH3SQEHe
	c5LK7QWyoX+H/sa5w1tyy08Hm5XW4RhVf28pe2dbz/8aBd1Iyh52itEEY+gkwyKnU+kwmKMz8op
	aTOTfNcNTOT/yUGwgpd3rDsc1n60fVUxjalUeHDJxYXo5eWzVO+0Xx4S3rCgHSm5O6N53c6jgIj
	uzvow+QiZFRruxdf8EdFlC6chSKYfEZtz2wemNg62GjGYZYvYkyxsBnrUW5qhfjMIZedADlJHaO
	modEzJVMKULFppf7yq9eKrdEg5RQhdoNOSkNSa8VwmNLjXure0UOic4001KfAzZKOSUf5WZBmyN
	rBY0i9uL0myBSe67KDo4R+7El9QhEVzF+MR0cQOa5uk
X-Received: by 2002:a17:907:7f86:b0:c2d:cdc6:8271 with SMTP id a640c23a62f3a-c31a702da86mr1287920466b.13.1791886202849;
        Tue, 13 Oct 2026 03:10:02 -0700 (PDT)
Received: from elver.google.com (124.100.205.35.bc.googleusercontent.com. [35.205.100.124])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dffb9fsm6059106a12.31.2026.10.13.03.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:10:01 -0700 (PDT)
Date: Tue, 13 Oct 2026 10:09:57 +0000
From: Marco Elver <elver@google.com>
To: Alexander Potapenko <glider@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>, kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Boqun Feng <boqun@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Yury Norov <ynorov@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 2/2] rust: kcsan: add KUnit test for data race detection
Message-ID: <as4DdRqFKxuJNDnS@elver.google.com>
References: <20261012134159.912183-1-elver@google.com>
 <20261012134159.912183-2-elver@google.com>
 <CAG_fn=UbARgkMYOHY9kbqvkCEE532_wnkKkv50H-JkuKWtCe=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG_fn=UbARgkMYOHY9kbqvkCEE532_wnkKkv50H-JkuKWtCe=g@mail.gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Tue, Oct 13, 2026 at 11:38AM +0200, Alexander Potapenko wrote:
> > +        // SAFETY: `probe_console` has the signature expected by the `console` tracepoint. Being
> > +        // part of the kernel image, it and `OBSERVED` outlive the registration, so there is no
> > +        // need to synchronize with in-flight probes after unregistering.
> > +        to_result(unsafe {
> > +            bindings::tracepoint_probe_register(
> > +                &raw mut bindings::__tracepoint_console,
> > +                probe_console as *mut c_void,
> > +                ptr::null_mut(),
> > +            )
> > +        })?;
> > +        let _unregister = ScopeGuard::new(|| {
> > +            // SAFETY: The probe was registered above.
> > +            unsafe {
> > +                bindings::tracepoint_probe_unregister(
> > +                    &raw mut bindings::__tracepoint_console,
> > +                    probe_console as *mut c_void,
> > +                    ptr::null_mut(),
> > +                );
> > +            }
> > +        });
> > +
> > +        let worker = ctx.clone();
> > +        workqueue::system_unbound().try_spawn(GFP_KERNEL, move || {
> 
> I ran this locally and got the following warning:
> 
> [  623.232012] workqueue: work func
> _RNvXsb_NtCskctMpSfuwL9_6kernel9workqueueINtNtCs1G77UTwpz6o_4core3pin3PinINtNtNtB7_5alloc4kbox3BoxINtB5_11ClosureWorkNCNvNtNtB7_10kcsan_test5tests9data_races_0ENtNtB1d_9allocator7KmallocEEINtB5_15WorkItemPointerKy0_E3runB7_
> enqueued on deprecated workqueue. Use system_{percpu|dfl}_wq instead.
> 
> Do we need to use a different workqueue?

Looks like it, and we need this patch to use system_dfl_wq:


From: Marco Elver <elver@google.com>
Date: Tue, 13 Oct 2026 10:05:52 +0000
Subject: [PATCH] rust: workqueue: add system_dfl()

The C kernel deprecated system_unbound_wq in favor of system_dfl_wq
(commit 64d8eae3f895 ("workqueue: Add warnings and fallback if
system_{unbound}_wq is used")).

Add `system_dfl()` to provide a safe wrapper around `system_dfl_wq`.

Signed-off-by: Marco Elver <elver@google.com>
---
 rust/kernel/workqueue.rs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 7e253b6f299c..e46d3acf903d 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -1063,6 +1063,16 @@ pub fn system_unbound() -> &'static Queue {
     unsafe { Queue::from_raw(bindings::system_unbound_wq) }
 }
 
+/// Returns the system default work queue (`system_dfl_wq`).
+///
+/// Workers are not bound to any specific CPU, not concurrency managed, and all queued work items
+/// are executed immediately as long as `max_active` limit is not reached and resources are
+/// available.
+pub fn system_dfl() -> &'static Queue {
+    // SAFETY: `system_dfl_wq` is a C global, always available.
+    unsafe { Queue::from_raw(bindings::system_dfl_wq) }
+}
+
 /// Returns the system freezable work queue (`system_freezable_wq`).
 ///
 /// It is equivalent to the one returned by [`system`] except that it's freezable.
-- 
2.56.0.385.gd3acb90ef8-goog

