Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793764147;
	b=WPovr6lGA264zNbRl3w6QHWXLPg+YM+7n+ir9d1gWm/0fQr3tCGXCSswa0TcFT3E9Uap
	 /lhb5T5JKbXCfsB8tYjhxudcpWIkgQJSvtDZXSQZtmxB/xLYUu5MdZJlqV7QtbI+vnC6E
	 VxnZ8vCI7xP+rfg2AbRmBvyrqUwHBH+DaojfZ+ibT6+ty/QeJTrtjui5P9wGLKJeXsWhQ
	 0gAp0K3isE3PN5/fJfEYBTyHGzGU7oex8QRmSzB4PygeQKIGvNifqieeWZ1jeo874YgNp
	 KwsDDWHKPSAHKIY93P7hFMZnoqPAoXujMVmx70SaWAfe+Dku4bqXrGapzbuV+QzofWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793764147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cKWjRS9Xq/l8hl3060rXc9wXNrOk8HsfCBzOk8+AuV4=;
	b=1gN1gFaTrMCqb1/eKTIEoHex2SQyWWevMV/fEzAGE2L1NYhra6rvHySe6KuUSRr470EY
	 q3pxZwNatvkB+B+GPxuQ0fzq1kNJch6Nn8275Uz+pJNR21vMRvoiiftSqEDYH/ER0Px+U
	 ruqp16JPW8goJ34mOuBgTMbJDaEiCSRn5net5XNhcFvlj9OjtrSfWrBI5GpquiuWi3G7v
	 /TNonvwSshRHmr7i1Bt+4ZnHO3LYcMBpLD1mD2lZkFPp+zSwzuCA4l9ABQRgsOOhR25F4
	 n+RAal3HRahisINKB9Z964uM3LDDCmK3+JfxgwtxRlRMRLumZrrKHvVN9DmJFopXdAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Zff7lCr/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A468606A328
	for <linux-kbuild@vger.kernel.org>; Wed,  4 Nov 2026 03:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A468606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Zff7lCr/
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-533202fe429so155021cf.0
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Nov 2026 19:49:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793764145; cv=none;
        d=google.com; s=arc-20260327;
        b=FIq8vVL+xC6Sijfo6uuhQy4RgzRijLXsVvx4VfiUI0384gchFhVAQ/IPXtcXhESGJ3
         h9cT1IF8+VeYppzqChmbQFw0wZPwmvbsFIJx9yvGaFGDIbscntHTrwCXjEovnEtHsXLt
         dc8CjSbUevUWyKC7YYM70IXWfYrdMKf6yZi2mnNhJs9xeKnweLcB3x2KIEksi0lLMfdL
         qL9nOqcfTrW1UCZ2LiIcCWtVVdzEf5nFxfqeK0iWYChD8KSaNq1Mv9BDHoJeYeVROKEZ
         DpJCcYPEta7wMJWiGpWx31vBSjcNIjGSXNyJ0dLAlVYGk615cFU1DgSRiYaH/aZECplO
         oi0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cKWjRS9Xq/l8hl3060rXc9wXNrOk8HsfCBzOk8+AuV4=;
        fh=k5l0R6vF9/tctqNaKX78G7FE9dRvTF6Rr/6fOl38GXw=;
        b=XapZCZpdpkK9ICsd+ZfJ17+1bQKaBmKk8ApEFEqtOMaqYlbsXFwS1FvD77XCul1U2n
         HIiEF0+jFSJb5PTlvR05roTV4XRvuwpJNWcXtXQaWB8+uoEHg/vBzU8gY8g3kD/S8L+/
         Xzl/8ANX+ZyuH73NKRIOnq0uTOx2Qd8mRPm+ud4tzzDrUpxfHTrj+wX9FDXOdEXwoIoX
         XhLCizsVT5Qjv4c/j7z1EBwvZ+F7U8Ba7EySocoKawluTYlB5E7EwChdB0NNj59+HkUH
         07wpHZHjqZ3yNEVjcA6JWfAMMaEw2z2ER/Vwz/w/kHC0JYqOwo91HSU4PFR5hQ0b9EgS
         eIpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793764145; x=1794368945; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cKWjRS9Xq/l8hl3060rXc9wXNrOk8HsfCBzOk8+AuV4=;
        b=Zff7lCr/RYzDOMb26mR07xi/YgRsLCknrcp7xuB7uYbEei3iXUJHgJAMS5sDc9s/p3
         e5VGpX9uTqFK3Wdv5gDPAQxvyroQYQfHwlWZlPA58bsPYLpTlyfBcRF4WalCLlkbFevK
         VSjvYCAMvny47vCLyYeWEr0vylVwhyEkDw0z5B8YPPpXD1zmHK9kWfoVCm+6uPTiWp4W
         2jN/qeIPx4hx78uKvP0NOTWfQepDmHq1Pln6bOhyt7nqhnVPCkbcsmrYHjX93TUtWnIh
         RcY3+kfHuG2RPAAWQ7dhhfhgP6QZ4/o2h/vMA3mI4hrEvYdwmBXODg8YOv8Ybn8qgR37
         8TSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793764145; x=1794368945;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cKWjRS9Xq/l8hl3060rXc9wXNrOk8HsfCBzOk8+AuV4=;
        b=cLGtFlfe7reeTuVu/axh6Ee2qBd2GtPpMtvcHzloRLl5A6K7/gCIW7gPy1uIEExbe8
         gxeAbh4h7f1KN2zuqAZNCEa3rwN15IkhkGzjbMnwQLZfyK3B3JGdE9P5wvMKsuJ3yfof
         Y3qG0snz/fxplT0DVLtlRLD8aUEUiVsr7HOXK27ikUp2xRBAeqMukFinv4KTP7bDLLDg
         91tOvhb9NRr+Ps+YN3TI/7AkYPO0sjyK4AgJnoPdax32uZ9hL2uKjwP2F8OwQ5WFJBMV
         wWd0yXPRJWsNmQAJWvH7DRUYpgtBM+DfEFuakgcz2U3VQ4mbkJmoYMDMu9Kn2KfoMFtz
         //SA==
X-Forwarded-Encrypted: i=1; AKwUvBxdzoRasWAhMMWEEvIm3BGDxSPme1drg2TBNTjvqakEmGoZ0UDE1pnQEWEYVZLPlX6T7cEP2oGU0owFa1A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8g66krkpED+n5iZTAHz0a/75O3ObGaSjFjgDuxp7WM9rP7+TC1
	6rNne67yupwdtrRHneme8rJ1GTKRQyNEb++ZVznIa0fd0AqEIidtC7jXtgnOYZynexzf3Qw6la0
	m/DPpcmTUncs/dlyX8ropvvT5PFMzt474MzdCzoYS
X-Gm-Gg: AYBFou1DAm93bvBc5NvyaW9Er6t2xSwyZuojxw6ANgMDLxVH0TtHaTkYEDB/XwlOILJ
	jUn5IHIiVCJnoEq70c/I6q1cKl62H6NXx/SyGbmyRpaZWm5bdC5oSEODidCoyFCqGI1F6tclYhL
	CpwP/yzhRCaVoU68RZYj6sZ5QNju1E3fqYxPVNRr8oAIKVl1bZ6BnQISeIy0euxff/m2/cQoSXx
	ys/Ee3tp09oiC96a5alffGqRyvS08KPffbkXy1BXHr/oA1HEAmUW7sOKq/bnkTnwqjA74yBUpvf
	YqN9h3HRbGOZ4iKFjfZekFkLo+PBEQbMuQMD1/iAKJnS4UeAwJRfh2oAv6nQIGYmk8NOmirP9aw
	8z8M9ichN6hXxI/T2KSfei1MvdHBqSB0d2UNTMA==
X-Received: by 2002:a05:622a:2298:b0:546:92f2:7830 with SMTP id
 d75a77b69052e-54b61e27b15mr3087041cf.6.1793764144251; Tue, 03 Nov 2026
 19:49:04 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030202710.3863806-1-irogers@google.com> <20261030202710.3863806-4-irogers@google.com>
 <25216bda-7e36-4bad-ba7c-1984dbb9dfda@kernel.org>
In-Reply-To: <25216bda-7e36-4bad-ba7c-1984dbb9dfda@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Tue, 3 Nov 2026 19:48:52 -0800
X-Gm-Features: AclHuK8jUTP0fZRLAUdhb4V7KjnS7XAslg-dpWxyxMmrVUFMhhemkzjXApXA5fA
Message-ID: <CAP-5=fXKeqy75_1p9TgrqOgw_Eh8h=U5FB40PQbZhwxczV-CrQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/3] bpftool: Prefer zlib-rs over zlib when available
To: Quentin Monnet <qmo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 8:20=E2=80=AFAM Quentin Monnet <qmo@kernel.org> wrot=
e:
>
> Hi Ian, thanks for the v2,
>
>
> 2026-10-30 13:27 UTC-0700 ~ Ian Rogers <irogers@google.com>
> > Add zlib-rs and zlib to FEATURE_TESTS and FEATURE_DISPLAY in
> > tools/bpf/bpftool/Makefile and use feature_rust_lib to configure
> > ZLIB_CFLAGS and ZLIB_LIBS when zlib-rs is detected (unless disabled wit=
h
> > NO_ZLIB_RS=3D1), falling back to -lz.
> >
> > Decompression of kernel configuration (/proc/config.gz) and compressed
> > ELF/BTF sections (via libbpf, libelf, and libbfd) processes data that
>
>
> Is there any mechanism in place that prevents libbpf, libelf, and libbfd
> to link to different versions of zlib (zlib vs zlib-rs, I mean)? I
> imagine you could have bpftool linking against zlib-rs, but the libs
> installed on the system linking against zlib? Also I think the static
> build with the LLVM disassembler [0] passes -lz -lzstd in LIBS and I'm
> not sure how it would combine with the change, I need to take a closer lo=
ok.

Thanks for raising both of these!

1. On preventing libbpf, libelf, and libbfd from using different zlib
   implementations: in libelf.so, libdw.so, and libbfd.so, the zlib symbol
   references (inflate, inflateInit_, inflateReset, inflateEnd, etc.) are
   unversioned. If we link libz_rs.a with:

     -Wl,--whole-archive $(LIBZ_RS_OUTPUT)libz_rs.a
-Wl,--no-whole-archive -Wl,--export-dynamic

   in Makefile.rust (perf already passes -export-dynamic via python-config,
   so adding --whole-archive is actually important for perf too so it
   exports the full zlib ABI rather than only the objects referenced at
   static link time), then ELF symbol interposition binds all zlib calls
   from libelf.so and libbfd.so directly to zlib-rs in the executable:

     $ LD_BIND_NOW=3D1 LD_DEBUG=3Dbindings ./bpftool version 2>&1 | grep in=
flate
     binding file /lib/x86_64-linux-gnu/libelf.so.1 [0] to ./bpftool
[0]: normal symbol `inflate'
     binding file /lib/x86_64-linux-gnu/libelf.so.1 [0] to ./bpftool
[0]: normal symbol `inflateEnd'
     binding file /lib/x86_64-linux-gnu/libelf.so.1 [0] to ./bpftool
[0]: normal symbol `inflateInit_'
     binding file /lib/x86_64-linux-gnu/libelf.so.1 [0] to ./bpftool
[0]: normal symbol `inflateReset'

   That ensures libbpf, libelf, and libbfd all use the same zlib-rs
   implementation at runtime, and means all compressed ELF/BTF/debug
   section decompression in libelf and libbfd also gets the memory-safety
   and performance benefits of zlib-rs even when linking against distro
   shared libraries.

2. On the static build with LLVM disassembler: `llvm-config --system-libs`
   emits `-lz`. Since `LIBS` in bpftool (and `EXTLIBS` in perf) already
   includes `$(ZLIB_LIBS)`, we should wrap `--system-libs` with
   `$(filter-out -lz,$(shell $(LLVM_CONFIG) --system-libs ...))` so static
   LLVM builds don't pull in `-lz` alongside `$(ZLIB_LIBS)`.

> > benefits from a memory-safe implementation. Preferring zlib-rs over C
> > zlib provides memory safety and improved decompression performance whil=
e
> > keeping bpftool aligned with tools/perf (including sharing libz_rs.a
> > when building bootstrap bpftool for perf BPF skeletons).
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
>
> Recalling our discussion from v1:
>
> >> Hi Ian, bpftool doesn't make an intensive use of zlib (mostly, it's a
> >> requirement from other dependencies; we may also use it to unzip the
> >> kernel config on the host if necessary for probing BPF features on the
> >> system, but only on some distributions). So I'm struggling to understa=
nd
> >> the motivation for your proposal, what do we gain by switching to
> >> zlib-rs when available? I understand this implementation is in Rust, b=
ut
> >> I'm not sure the added complexity and feature probing in the build
> >> system is worth it.
> >
> > Hi Quentin,
> >
> > At my workplace, we are transitioning from zlib to zlib-rs for both
> > security and performance reasons. I'd like to keep upstream tools
> > aligned but they don't have to be, it just seems nice. I agree zlib is
> > of a lower priority to users than, say, zstd. For attackers, like with
> > brotli, it is probably an area of interest. Knowing the implementation
> > is memory safe is at least something in favor of zlib-rs. I sent this
> > series out as an RFC because I obviously have no way to mandate what
> > upstream should or shouldn't be doing. There are things that can make
> > life a little nicer and easier, and this patch series, for me, is one
> > of them.
> I understand you're transitioning to zlib-rs, but the current patch is
> not a full transition, in the sense that it doesn't replace zlib with
> zlib-rs but allows any of the two options; and I don't see support for
> the standard zlib being removed from bpftool anytime soon, which means
> that in practice, we've got to maintain compatibility with the two
> versions going forward. Others may want to chime in, but I'm still not
> convinced this is worth the burden.

Because zlib-rs (via libz-rs-sys) implements the exact C zlib ABI and
headers, there is no C code difference to maintain between the two=E2=80=94=
only
the Makefile selection of ZLIB_CFLAGS and ZLIB_LIBS via feature_rust_lib.
With the symbol interposition above, bpftool (and perf) get memory-safe
zlib decompression across libbpf, libelf, libbfd, and libLLVM whenever
zlib-rs is installed at build time, while still building everywhere else
with C zlib.

> You also mention zstd, do you plan to add support for a zstd alternative
> as well in perf and bpftool in the future?

No current plans for zstd. Unlike zlib-rs (where libz-rs-sys provides a
complete, drop-in C ABI for both compression and decompression and is
already packaged in Debian/Ubuntu/Fedora), I don't think there is an
equivalent drop-in Rust replacement for the full libzstd C ABI yet
(ruzstd is currently focused on decoding, and the zstd crate wraps C
libzstd).

> (By the way, if you allow me a short digression, you had a patch related
> to the zstd probing for perf and bpftool [0] and I don't see in the
> tree, do you know if it was ever merged?)

Thanks for the reminder! That series wasn't merged yet=E2=80=94both you (on
patch 3/4) and Peter Zijlstra (on patch 4/4) gave Acked-by on v2, and I
think it fell through the cracks waiting to be picked up into
perf-tools-next. I'll send out a rebased v3 with your and Peter's Acks
collected.

Thanks,
Ian

> Best regards,
> Quentin
>
>
> [0]
> https://github.com/libbpf/bpftool/blob/main/.github/workflows/static-buil=
d.yaml
> [1] https://lore.kernel.org/all/20260909204122.1993010-4-irogers@google.c=
om/
