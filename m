Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795620837;
	b=cxpjXzSfeU6r3FQKYwq+xJHsFU8AA+yRaKYWRBDolyhcU4zoua27eSpIbdI+jg8TKw9d
	 9+qY0SnTOcA1JthjodFaTbvHAXZSvjVa3lrygjQejZIdc6vQXb1ZugkH7jwaun3n7onfU
	 iJ9cx6sbUNi5jhzh51qFObviyjTpx4dLp+Rben+zdH9hxEKPt9pNaisweX8kETFLAbJE1
	 Ib435dtnjt/dwhh+32Ow365zFX8A3xXV0bWHIAVm/KnLOT+4pXYC5ORNe3PRgK26Tu16L
	 Oz7zboPYpJ+hA9J+ZV/d83vSicxFHYW71qY86RqO0Y+rj46SAtgU8LkJgDYjNRzM/2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wKqdQvSAuRnmEmZrQT2+mDn5yykXvIjFQspA9QZyZuU=;
	b=ai5g2fdTyc4FhtidNUXBMiP8pUFzDWioh9lySJrI9Y+/v6Yu+HfVd019IYES/c4y5UOQ
	 pjrKAZA4jG6AT7aFPsISIdwV5LxzQnNHXhsobQfzkF4ZECVpJSGoZCE8g/QLprjrlbh2B
	 1JBqdDzMchFDip7mEEiszCfOK2XnrriWGETxfXp06uiFnfqyNgepqpaQbawCc5EQvUXrF
	 7kqdsBH7lpVqE8Zrq9h75t+23G8PqN3wmtDFzTjx5yq6rdf0JX1AcpGwro3D18i599tUz
	 hk+svJABJzEzbbbmAdik9Cb+QAHS1oAQZB5MW1N8oWS+m6Sn6qY/RbEzXRLuRy9QDtw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=buKUYa8n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2624F606A32D
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Nov 2026 15:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2624F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=buKUYa8n
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c14b6ac47eso742298e87.0
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Nov 2026 07:33:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795620835; cv=none;
        d=google.com; s=arc-20260327;
        b=RejZTp20locynJEgRCmog6fHv1YDfrtEv0JR5XC9dKMbCc3FH3dVOMvzBAEwEEDsoD
         ZDO5MZoxTpnnyGB8CFo482ymP1g/yKnvm7sLJ7j+NQypgbEgffI1vsgO32FZUz9L0QW9
         YGey3laBLLuljRkwzZulWaaqQ+IovbjUu9XSX3zzUEF6NnbzGVyCDSl7lPdAzrObn1wV
         ZJ+NsekZBVJQIq74ygmJlbhVuxPZ47zWUhI90wtX6fnUijoTPcDAEWMJRYXa/itNC+NY
         iP3+DLIus7RnhXQ0iRjL2MGp7HX8AD9Z3cTAPh1MWldOeUkzjUMDFGuaxRRrJbCcODSZ
         JeEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wKqdQvSAuRnmEmZrQT2+mDn5yykXvIjFQspA9QZyZuU=;
        fh=RRKGTmGYUikLCAFJruP++cUdJD+Qslbs9ss1pNixKoU=;
        b=ZAxHu1paDPWnWkP1u+v7SiyP06JFi3GhotaiTksQvXL00fjGDxJTa+AHCRS+p1OKMW
         4hHNsWfMjWOkaU+W1zA35MPHPF7WK8rX5KWu86we3Z/bzV784urfygKPI0zB/2ZD6t5h
         9V1OB8TH99j/DbdcCt8jYCG+w9+xuLKZuW9IbE2Db4h+jPOJ7SRQzWKxNRnJZn7+Rluz
         2o3RdG38xFW3W0cbj1v4ykzcGZH8/1ttyxoFlNhRXe2cnUApZSz4854JDUXVTdJqRSAK
         SpBPbNa+GDkfv2RDRrnJpb1OPF2RksbSP98qLVG1gptkzSWIu0ZTv3qdquDkDlebqt2G
         V9/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795620835; x=1796225635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wKqdQvSAuRnmEmZrQT2+mDn5yykXvIjFQspA9QZyZuU=;
        b=buKUYa8n/c+VXe6APnpgpXA6FOrq+FpjqfwIVQgo23FhWgtM2lNC3OswV9rT/1j1St
         s7iH62UZ9fSmbTJmNmOe1wusd6iKi7MKlpK7OQEZEeZVEAn1tcE9gW5483bhuLeVVlZX
         tGZhQYHe59rb/eOybw083v6sewKrRTARw8BaOX0EixFJjcVTURpw2ruRgQaNIr2d12TB
         1eAlRqX28isVPYAIbEdIx9S2DjhCtfSLFhVd4UQuba+fFbGKhnhcP1QT20dQyldgF5cO
         j9MrI9ffEitabU7NvGkF5I5XmQ7HGSV3Mvyua2JTeZmuW2ZM50kod9BFAcntFma3EQ+0
         sgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620835; x=1796225635;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wKqdQvSAuRnmEmZrQT2+mDn5yykXvIjFQspA9QZyZuU=;
        b=VZu49KkcIpp/LlgM613XWgg+vNlgjLPKPr9t3nQgvcN3rkpoNHbcWAspJMxMU0W05M
         dIQbqHWAm/vs5siY8ekhAgx1i7B6ibhXvbabbbC5KQ8EzYdvS9YUi/7T6X4N+Op5LFdO
         GMeZqu1FJm9Bse15YkRYY4UgSPX9ufM0UmaZWRk/NdwE1GHeTPi0CgKf8lirSOHXwwhn
         f7aGVuE02OxIYe8BWcCnqkR0wmheSGBxHKMlvz6hBf8pU7TPpFe64RdQTA1OZmuptwUV
         ZNudunujCCBdS/aBwonvQrE2T1T9/4F2rAlIQzWXtt8i9FsJyeyowVRA7gSFgno2ejDM
         7BdQ==
X-Forwarded-Encrypted: i=1; AL+hErHdpkNJw1Vzlx6AV7U141gWQimZZWxZ5eWdl/5O7vr5XE0yZivI+Enre/9/GNwjCq2BrFPK7slgi5AHhk0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sxmT7D9zQ8m2/7iTAaP/o7W9fXB4eDY1aDsi/QvHTZvx0cc2X
	5I15/12xAQwaCObchT/SooN1WROYl4jWoTh5DLJnYJapaHM3M1PCDOus8J+Hs+FgOqYdD35U2PO
	wmYvaHj+kXJAb7XKjtvD4r+P2yJMDVEY=
X-Gm-Gg: AZFdTZf8Asv55TVz5l5X/9gN+jstKWPsggiIZX2iLTpUOC4ZkKKM6UNwx2PD6Uz1djL
	ipjOkTSDt1VLdeon5PCV3EpUmc9LOkm0nuJwX63XG67Qfl+K20CLcxh1h/bfyuzB2OZPIi5T0Ic
	L2Gk/53uueUld3gFePScnLzfIE2QlZ1ih+5S75Wd0RkzVkt+d9KGuiZoBYqjvK1+XhGh6dvAXFF
	c4/TiIVg9ew0IhfNTjJ0vYvIGx7OQMgnifgTFkTfMyFZhk43ulpeEzi8lw369GgJrnoI2v+TKo5
	HPUBZf6vptfCcSpiL4H30QiqKoNlVKSnYkl1PaxwYfpH8oSz9OyBrxL94ImC2tDNGbo1vfEUZN+
	QEPAYei2gFpRqFubkUAHuCn30T+YpSRVtgvstn8KCjnUqM58J8UYxbHZsZ8ttQKYVmQYLh9E34B
	Dv7SO1S2BuIi1QW+1ThHxxxKPIhB6zO2QAlrwc4eq+EbOhTduwB9UxqTrjdsorEGq+GGEriqpH7
	iWwKd+EZ548s5PeYAsYdoGNHBZbNn3YoKC2wfnKjIGfH8o/gfwRUPkSWridVNTbj6nV4SIU
X-Received: by 2002:a05:6512:6c3:b0:5c1:4a47:b86b with SMTP id
 2adb3069b0e04-5c1bc785b7amr6221022e87.3.1795620835046; Wed, 25 Nov 2026
 07:33:55 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124-build-speedup-v6-0-141a4f861c67@kernel.org> <20261124-build-speedup-v6-2-141a4f861c67@kernel.org>
In-Reply-To: <20261124-build-speedup-v6-2-141a4f861c67@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 25 Nov 2026 16:33:42 +0100
X-Gm-Features: Aa3M54rAUhOIl7nJAGzRxUt_IUS4JYfamPQ_n0qFr3V4ZOsnZoEMWuF3JwFrbDg
Message-ID: <CANiq72kdpY_tr0Gg16b24J1J-Duj3YS4rJ0CgNYVWQqmQv=nxg@mail.gmail.com>
Subject: Re: [PATCH v6 2/7] kbuild: implement and use depcheck to check
 dependency timestamps
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nicolas Schier <n.schier@fritz.com>, Kees Cook <kees@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 1:20=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> A dependency that is also a target of the same directory (e.g. header
> generated by an if_changed rule) may get remade later in the same make ru=
n,
> so do not treat a target as fresh.

One more thing I noticed: a header generated with `filechk` does not
have a `.cmd` file, so it is not covered by this.

It matters for targets that reach such a header through their `.cmd`
file alone, e.g. single targets like `.s`. For instance, after
building `arch/x86/kvm/`:

    make arch/x86/kvm/vmx/vmenter.s
    # Change an offset in `kvm-asm-offsets.c`.
    make arch/x86/kvm/vmx/vmenter.s

In mainline, the second one regenerates `kvm-asm-offsets.h` and then
`vmenter.s`. With this patch, nothing is rebuilt.

Cheers,
Miguel
