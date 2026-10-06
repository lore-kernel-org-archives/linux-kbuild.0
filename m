Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EDB49E5C2
	for <linux-kbuild@vger.kernel.org>; Tue,  6 Oct 2026 16:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791303065; cv=pass; b=W01qkWDR9X6IbG4up8xCWdDKBkC5Ut2MmsOukYkzwjx7oanKFX7mheKt1YwXoOC3Xz5QMt3+v07JxZC3vFcPA/Dz4QKXFY6g4M8yD3nBmCc1rNAPmjRIp/+TyoxWiHtRbbok8xZgpdAv/UD21GiV81M7+7gTk+YLQrQp2+oj9qA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791303065; c=relaxed/simple;
	bh=9WCkiE19cbtAuYYQ4uqsh1anpnBBbEDR9fWCfux10TA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bIYtqQRWUy55qIqhUfZi4k6f1VeTHMmd7UxrKMm+X1zYc9vTpyROScNfwGc0rZz1LQ167+gYyutUk1S7yarGunfpjb4MhiYFB1zYDRGANcyt8Cs8VUvQFwCZ2+HaRyuLnjmmV9+6SPYd1sZ1Z1rMnEkSAU5t5AjiuQn92Yro3Uc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KAol/EVW; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KAol/EVW"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-885cf67963eso9928917b3.0
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Oct 2026 09:10:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791303056; cv=none;
        d=google.com; s=arc-20260327;
        b=crr34RP3/C5fAfv5Awe3gBaT0PWFyinNXy89hTdPYTaymt8+RxodskWDw/Zta9Aj9G
         3l2NguUzvjQE9g+50b/mxT+nmO2srCGxXdzk+TNieavdzTsuuIqiw+xWFhUTsDszK9ES
         ikU7wQz9hjDjBuBHg9tTD4VPtcMko7sjW8QJYFWMt+WjnkOH41wHnfid+R+HTxwc5uhQ
         M1nslK7PVvxy6wY2TAIxpPjcCPvJdNaSjAIOVjZr4tx56YPBqkkJDDIBPn44rO2Vd8Ei
         9EJwG4vjYhVL1qfCnnMPFaHaBexebp6O8SbyNdPnUdzhyofW2Y126O+zGcF1oAWuQ4me
         goFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bfR6JmlAO4hB3DVN/nKPNuuxv4ZNwhQvNLDvwEb4/Vk=;
        fh=KYTw0o2BH849XkroIn39s7LGAWxBd0EGKeRQuVtK36k=;
        b=aQZHIiCdZkEpR76kOugRKNIVn1vwRQ2fA0hAyj3N3vtnZ/+rdchEcmDCgGPLt3A1Ei
         rsz7jrL0+ukelEeb5YFtwxyz+KQTDk734dGxfjWXvWRCuu5hYY+q56cfpfOUgHID/bhs
         HKIS9c1lfEYLwr4Vwz693jGjVxj976uFJBD0o2o+9H74t0KKPggNrt256gKRjDce5fVs
         cWTRvO+Xb812cbYf/is+At4auSRSKnvro6gPnmphHyN7+Z9MEVgfWtoFLt2fZ7cQHzaw
         R/84RfuH/XrpOkJDA1hm5GrP8+0LyiI0JtbyDOnteef3odeEr9+w3d7ruqah2dQoHzDi
         9skg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791303056; x=1791907856; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bfR6JmlAO4hB3DVN/nKPNuuxv4ZNwhQvNLDvwEb4/Vk=;
        b=KAol/EVWndwCAAefTkH6Xt23lTKfF8bg89lV6Q/YwYVIALOx+VT+A3ReJEZd7mhVHY
         u5uAwWXDtUNCGzoumqWqKUFMxCuWAqWc8E48Bs4q8GQJ5DV/MYyK5FkbCaVdzSvlgJAj
         WpVwnmuRWxclQi+qIP4Q+Q8r08cIMnguge2IESogruJD5JBKihZ7itYtdLHX42G+43CT
         9v30tzlxMY8Uz6u7pbHeR+g580BmjbeMFh+TLSDfjduVagvTeg3hroCyqU1v5CFFmeXh
         hlI6dVwjfm6h1J5fH+akAR/gBAnRkbR9KhvIjbt91Gqw4uC9O8uVloodiFrKHYVwC7xk
         cjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791303056; x=1791907856;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bfR6JmlAO4hB3DVN/nKPNuuxv4ZNwhQvNLDvwEb4/Vk=;
        b=eJNSjZ80kyoqAzhX/BSRzZmplmZbw3hKZ4k7sjWuf0mgBvOJZonsDuy3XyIVzbXYXV
         Dba1L6XXu5BqktKezXIQItFKme46w1Cz4WPR3oD+MdfiDfh1FxHEl30mIQQ6ZKNdxp+a
         RA7SxsevXLeFsoW4eyIKRGEmWh/eU7qfO3KXVjfeVSxt81jvWIk7UTVFYaYYolticN2I
         I09fsu7OnImaj1mJWKVcmFHHkSrXKhKENM5iXKF+5QYJU2lAgomjHF2zC1WpS5abwoeM
         TYgxVFWvT88+ejPdjlC8mQ+uOBxN9j59DR7yAv6lwRtQIegMO1oMdyGYRMKeJyraJvkp
         a3UQ==
X-Forwarded-Encrypted: i=1; AKwUvByZ0UjTQyniAjbTdqmUy3JkXaoc7A2JRZ0vbAc9707WX2aBF+Nf5xWqnn4w6Tw/S2OWkuIWXgjLZsSatHQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJA8jCDwPAKO4BixWz0iMZUmZlC4mot52Wn3jv/1HE1p0O6oJ3e
	app6/9npRogMYyEs97Vhf3Ipzgdn8TbBrrOCrTllgTdnv0GmFhqoHf1JYbFghVGDs7BBT4FsoKp
	Sy42VACR+1zO5q50KFSKc3RV8QfTRIArCDSwNfwZh
X-Gm-Gg: AYBFou3yUhtB8xbo6yA5qvug2C8ZR1oPVscyJogz5tVuc8e8lffM5nzb4JxH/aNpFlO
	LiuCkpcvJgnwCQAOZxaktqWPrFHJp0M2n/l+14BLroLISTUlzmO1Cr1bl5gE3ofj7VPxc+NqnjP
	Pd+8vTa8tMbzp+ACjlPHo7O99aFNzVaYP70rXqWE39Gr3+PYQoSFUahwXe0YRbJmGIRSGKvyWvq
	XCA10voW3Rb1mfCgWHO3lurUD5L68qp5RB5u35tQZIdVmigg99/jAGdNCAL9I2ipVSTXhjoWw7k
	StEPmVoL8qcFVk6lhSi7NTj3XRSTShhaxhb3wWzWzR8iF7WkeTwbgA==
X-Received: by 2002:a05:690c:5302:b0:8a8:7e5a:dc2f with SMTP id
 00721157ae682-8b04f40f097mr9171807b3.12.1791303054779; Tue, 06 Oct 2026
 09:10:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <00ed0b57-ad05-4c5d-b152-7c81df94b23a@app.fastmail.com>
In-Reply-To: <00ed0b57-ad05-4c5d-b152-7c81df94b23a@app.fastmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 6 Oct 2026 18:10:17 +0200
X-Gm-Features: AclHuK_OeB6Z7-eCIUVq_1RabrgIKOGeEVPLb2q2UdMqE46rpsfhYWgMuA5UU2w
Message-ID: <CANpmjNOaykC4McAj=gZghqPSQc9aGBP_CjgKmp3n2yjeJTxDSA@mail.gmail.com>
Subject: Re: [PROPOSAL] Replace gcov and kcov with llvm-cov
To: chuck@wolber.net
Cc: kasan-dev@googlegroups.com, nathan@kernel.org, akpm@linux-foundation.org, 
	anton.ivanov@cambridgegreys.com, oberpar@linux.ibm.com, ardb@kernel.org, 
	arnd@arndb.de, bhelgaas@google.com, bp@alien8.de, dave.hansen@linux.intel.com, 
	dvyukov@google.com, hpa@zytor.com, jinghao7@illinois.edu, 
	johannes@sipsolutions.net, jpoimboe@kernel.org, justinstitt@google.com, 
	kees@kernel.org, kent.overstreet@linux.dev, linux-arch@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-um@lists.infradead.org, llvm@lists.linux.dev, luto@kernel.org, 
	marinov@illinois.edu, masahiroy@kernel.org, maskray@google.com, 
	mathieu.desnoyers@efficios.com, mhiramat@kernel.org, mingo@redhat.com, 
	morbo@google.com, ndesaulniers@google.com, paulmck@kernel.org, richard@nod.at, 
	rostedt@goodmis.org, samitolvanen@google.com, tglx@linutronix.de, 
	tingxur@illinois.edu, tyxu@illinois.edu, wentaoz5@illinois.edu, 
	x86@kernel.org, peterz@infradead.org, sashal@kernel.org, 
	Aleksandr Nogikh <nogikh@google.com>, Taras Madan <tarasmadan@google.com>, 
	Alexander Potapenko <glider@google.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Oct 2026 at 17:14, Chuck Wolber <chuck@wolber.net> wrote:
>
> Stemming from some hallway track conversations with maintainers at LPC
> 2026, I propose replacing gcov and kcov in the kernel with llvm-cov.

I know the origin of the discussion, and wanted to chat, but I guess
that didn't happen and instead we get this proposal. It would have
been good to understand the requirements of users of gcov and kcov
(more below).

> llvm-cov instruments at the AST which enables precise mapping back to
> source code regardless of optimization level.
>
> We have a set of patches [1] that implements kernel based llvm-cov. They
> need to be updated and some additional patches are required to address
> some stubs that are missing noinstr annotation. But otherwise I should
> be able to send a full set of patches (including taking on the
> maintainer role) to remove gcov and kcov and replace it with llvm-cov in
> fairly short order.

The hallway chat was supposed to figure out if there's a way to bridge
some of the gaps, but jumping the gun like this without having
addressed the requirements of kcov users does not make any sense at
all.  As for gcov, llvm-cov was designed as a better replacement for
gcov, so that makes more sense.

Ok, well you made me untangle the most important differences between
kcov vs. gcov/llvm-cov below so we have it for the record.

> If there is a desire to take this in pieces or implement other
> intermediate steps, let me know. Otherwise I can generate a monolithic
> set all at once.
>
> [1] https://lore.kernel.org/lkml/20240905043245.1389509-1-wentaoz5@illinois.edu/

llvm-cov is generally useful to have; llvm-cov is closest to gcov, so
that might make sense to replace.

KCOV, however, cannot be replaced by llvm-cov. KCOV isn't a coverage
reporting tool for users, it's a low-overhead interface for fuzzers
(syzkaller/syzbot and many others). llvm-cov has no equivalent of:

- per-task and remote (kthread/softirq/USB/vhost) coverage collection
(to avoid polluting coverage with concurrent tasks);
llvm-cov counters are global and polluted by everything else running;

- ordered PC traces (edge signal) and comparison operands (TRACE_CMP);

- performance: a per-task mmap'd buffer reset with one store, vs.
reading/resetting
megabytes of global counters after every program;

- GCC support (we may want to keep at least one GCC-supported coverage tool).

It's also UAPI (include/uapi/linux/kcov.h), with existing users.
syzkaller heavily relies on KCOV's features above to achieve good
performance and coverage; there's no reasonable way today to migrate
to anything else.

As-is, NAK on removing KCOV. Consider replacing gcov with it.

Thanks,
-- Marco
