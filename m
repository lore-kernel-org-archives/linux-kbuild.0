Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793416225;
	b=kgHJeidB+tRuH7P3YKnQKuUmXQH7RDUosz1edRa8RGs1BYS4c/f6J5blKJgsuvh0xhGn
	 m4xLxXdxN61AXMIBoFSZwBNz9oP/gkh9wG598QUtrG1mZ3k6wt0hMwKSns7w1OcGRC2pO
	 TyhMwg/FYruCqErAExcU+cRlPfI4N/ZuEO0QCnFLBPhDK7emFx4LUJeZb9wzklnW6IhJk
	 jeh2tfyBu7H+K6Lkm7qpSxL+sNv1rHHP9zf2BvEY/ufN9LWBx7RWEhr2Yh9mviAGGi8m2
	 qKk/2fwNuC43YlvfLlEeDasD1kSyua02b4anWt2I86VA7/tDDx9VpL0mU0wdnc8f9SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793416225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rSQVuufJqG4DagM4PmCmZM1z/EqJK6JLyOoiv3ybUJs=;
	b=NjW47nHz2dkMvyeEFhILVwAHbMetG4aEJAIvPRlwAAqP1VYZU+OSkPfZx3L+4MfiL23T
	 cy0jkqRWzmgKDHhx1s51ZM3IrGgSXkqaYsDuDg/K8zdT6907uzkNEJ4Oh9QrZdpM73WiJ
	 fzx6tj2Hof6zjSTRDZVfWfVxNUpAfpR1uge8ygtUNMznNmN1CAWppOuK2TJE+GREiVe3f
	 EzGUIxGBbnhNcFXnoG21xV2kgkqkmR9+axpLHd9mYOCa3+rfPCksYks+huxasyKCRr5G5
	 P8w19h+KRS/c+8Y9Nc3W0jiZgIxJZrGfM9eEaQJwZ/udDFwY8WUlOk6iZRMoWrFtFBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TAQY1f+q;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D52A606A31A
	for <linux-kbuild@vger.kernel.org>; Sat, 31 Oct 2026 03:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D52A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TAQY1f+q
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b1b13e09ffso1857386a12.3
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Oct 2026 20:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793416223; x=1794021023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rSQVuufJqG4DagM4PmCmZM1z/EqJK6JLyOoiv3ybUJs=;
        b=TAQY1f+qcYj8+tbBoDh66s7ra3AFUjGNykye+dGi328lF0Kq831n3SFZEjzEtyvnbV
         JxYs6LkOH15TA0raukNSQE9tfej/6hRU8nPi15mLc+/XgZZ/80KWFoMtHTdi5QgVrfMg
         VtlUceT+Bj4YW05YP4jscly2f3dHqSU1FvvXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793416223; x=1794021023;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rSQVuufJqG4DagM4PmCmZM1z/EqJK6JLyOoiv3ybUJs=;
        b=i4IF5ij28s4Al7DOBe5J2jMtaNNqMkzgVuNH7PbB8CvoeFPN3qEpOtJWrevbLL/EuE
         O7xivsHIzEJiFubA2s49zoJP7a032cXBelQZQVS44J56wU7vutd8pP+x+0t3beQwu5LF
         NL3glUdjJAnL3bkFnQTmT+PmT2rVdNpRaCb8w7rTzP2KXYOBWn6s4hz58tbss3ab1ZvD
         P8CALDRqLo+b8uutwapI8VWuDtErpBQsT1N/zHudqH0blmSy7q21IQPjPEYQrQk5fboe
         cjHCaSN2Tr7UWiiiGcE3X4l33jdS0IAH/TzZgYsNH/YHDBzPbwaI6ykxq9rwkhm64BKE
         FxXg==
X-Forwarded-Encrypted: i=1; AKwUvBzjp8TsMrCotNxJV11vEicFgvvL06I4IPoqLYf0d+rUqxgQSjuLTm4X3lesO7LkSOgyTNPFAYg55NTeVpk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlwP/sxOk5Gh9CYabxc6scS4bj0GHUgyxewPnSmyuC3Y8I6Wp/
	ZYCkF0A+S8w2zdl6BbbFGVRddrgKyCmp+nmjPhuGKLeQpLBadVTp7IDL2P8hiDLkqJ8HKwzHdX7
	VB0Q+8WnY
X-Gm-Gg: AYBFou3tSOKvHr6LWOG2r4xaCELGYyeq27D4tBBTd6hS7EVsfktLm4m3oOAfbTfl+rX
	87pPTJ8AqODHc9QTPIii9hat15csHp1yTB4ha/wbaotDOpgo6myb/6ATG7GjSF7bvQfkYjGKSe/
	2Bybx8Di+nc0eiqLO6qIjTnTM7rjIxG2K+lr1Xs+jTbu0SZPtfNXePrC+Aat9Aw7cQXLZUalpV5
	angg8UPO8axLJrOU8nMJzsvzQET5brfxtUuAfcAKeaO+7hixOufzdircc2IZZ7UFGn6hF9QPuhG
	cMcHb2h1HNEo2TdmkfHrfwc/f9hOnv5dWmueGOcctJN7nTWVN34ukAFV5gjz1owiMncM/YOg7f3
	QNxa0p8bBifnCDhZfsLViUatLAD3CzPmrpuIkzmjSzWOpX+vZOzLLtDvQYO04PM+mDiRYezKTCA
	0J8q9ai8TqgVfjGZU0lKPkXLmMharY1yDiWcXU+w0p0YTS2H2shyr2LKJ1miDKjYt+Ok/m7kKkG
	/72aG6CsLaH6VHrORwLokptOE2wXXQ+vURlBz2Ree7YTnIKUshapLdRUpYAfQbWQeVvUCk/ytH2
	BCdUnHxmBHgh13fUwwDAVcPubN6GGz6XpoldO/5knmuvGWgx7gps4P7pagvjoDXFhqx0
X-Received: by 2002:aa7:c949:0:b0:6b1:c7ae:ec40 with SMTP id 4fb4d7f45d1cf-6b4d337c917mr2093372a12.4.1793416222253;
        Fri, 30 Oct 2026 20:10:22 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9ee7c9sm602205a12.7.2026.10.30.20.10.21
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 20:10:21 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e0d885929so1070879f8f.3
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Oct 2026 20:10:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxrDkQbUmqnCEfWDAc76GYUN3gOloI6GPYCiB3gig7tPe2fWn0a41sqn1LipWVxlioJ4HFE7d0/38Xrxog=@vger.kernel.org
X-Received: by 2002:a5d:5f84:0:b0:48d:eec6:308b with SMTP id
 ffacd0b85a97d-48e6e4f561bmr9818154f8f.21.1793416220997; Fri, 30 Oct 2026
 20:10:20 -0700 (PDT)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020153652.2907186-1-dianders@chromium.org>
 <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com> <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
In-Reply-To: <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 30 Oct 2026 20:10:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xxn75bf6ZjRPyQ5jfWwxx9cPe8_8bV6qzAXQc+gckB-A@mail.gmail.com>
X-Gm-Features: AclHuK-bghq4wzz1qNlwlR04GGQ-u_3zjoGTgsEW-iZ0A7dRvqdHdSoL4JcYqzo
Message-ID: <CAD=FV=Xxn75bf6ZjRPyQ5jfWwxx9cPe8_8bV6qzAXQc+gckB-A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] arm64: Add fit images for sc7180-trogdor and google,lga
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alice Ryhl <aliceryhl@google.com>, Andrew Jones <andrew.jones@linux.dev>, 
	Bjorn Andersson <andersson@kernel.org>, Breno Leitao <leitao@debian.org>, 
	David Sterba <dsterba@suse.com>, Gary Guo <gary@garyguo.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Luis Augenstein <luis.augenstein@tngtech.com>, 
	Marco Elver <elver@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Nick Terrell <terrelln@fb.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	cros-qcom-dts-watchers@chromium.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 30, 2026 at 6:09=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> > The FIT_ITS path is a second way to build image.fit alongside
> > make_fit.py, and much of it repeats what make_fit.py already does: it
> > puts the root compatible from each DTB into the configuration and
> > compresses the DTBs. The series adds fdtget/fdtput, sed parsing of
> > /incbin/ paths and a shell loop in Makefile.lib to do the same for a
> > hand-written .its file, and the .its files repeat the DTB lists from
> > the Makefiles.
> >
> > Have you thought about extending make_fit.py to take the per-board
> > metadata (e.g. from a small file next to the DTs, or via
> > FIT_EXTRA_ARGS) and to run fdtfactor itself? That would avoid the
> > in-tree fdtget/fdtput, the mkimage dependency and most of the Makefile
> > logic, and trogdor would come almost for free.
>
> I certainly can do that if that's what people want. ...and, yes, I
> think it would simplify some stuff in this patch series. The
> question is: what does it look like? Is it a file that is a list
> of devicetrees along with descriptions? The list of devicetrees
> would be to limit which devicetrees are built into the FIT
> and then each would have a description. ...and yes, that would mean
> it would need to be updated in parallel with the Makefile, but I
> don't see a significantly better way to do it. Yeah, I guess that
> could work OK.
>
> If so, I think a bunch of the patches in this series will be
> dropped or look very different. I probably won't directly reply
> to your comments on patch 2, 4, 6, and 7 if we go this way.
>
> Should I give it a shot for v2?

FWIW, I did a quick prototype of this, and it is definitely a much
smaller / less invasive patch series. I've got
"sc7180-trogdor.fitconfig" and "lga.fitconfig" files. Because they are
easy to parse in python, they're in ".ini" format in my prototype. So
"lga.fitconfig" looks like this:

+# SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+#
+# Each configuration description encodes board and SoC matching metadata
+# for downstream packaging tools in the format:
+#   "<Model> (<key>=3D<value>,...)"
+# where <key> includes board_id, board_rev, soc_id, and soc_rev with
+# hexadecimal <value>s (in any key order).
+
+[lga-blazer.dtb]
+description =3D Blazer
(board_id=3D0x070406,board_rev=3D0x010000,soc_id=3D0x0005,soc_rev=3D0x01000=
0)
+
+[lga-frankel.dtb]
+description =3D Frankel
(board_id=3D0x070306,board_rev=3D0x010000,soc_id=3D0x0005,soc_rev=3D0x01000=
0)
+
+[lga-mustang.dtb]
+description =3D Mustang
(board_id=3D0x070506,board_rev=3D0x010000,soc_id=3D0x0005,soc_rev=3D0x01000=
0)


Happy to post a v2 RFC showing what that looks like if you want...
