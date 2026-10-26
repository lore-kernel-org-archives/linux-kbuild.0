Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793054920;
	b=W18XPjAaM47jvNB+ekgIVfuSAAoPelVVllzJgWV+7rqyjF2cV1TtR3l6OMy0t6q4aLvF
	 gH6gzGaUUiX1llcbio5x2FvW4VXhVWkUKd6DAMiScZf3KJcY0OeSwi6rcswlo+y0EJd4n
	 uVUpfu8xqE/8upiO8M7m/TqjFSn5BG1QCWY+aRQfhBV6I6hFhu6y/A8uIt6kHeodXG/fd
	 rmLoFqGdUo/UP6CqHKjYvNOen1GA/WpYD5XVmYr2vY7uKz6+3elsWidg3Y3cwZoWWfYe+
	 hllNC2FQvBkR93xmR/krtmD3Epce4YNfXeKPyVDviOM3DnLq4pDTm3YAtKiS/p6XYbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793054920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mshdBP7zWJ8tsttLUx6xhnibBdLHVDUK/dBlFucrT6E=;
	b=5blgjwsoVyYpqDUHEIlm0jzXglzZnyOD1k/h7KwrlAhpZAaqMsEfVdcP/hpU46MofUEs
	 rAEgPcyXiFfjNb+Wxx4qFB30+urER73apApUmXDfHgvEvL3hhAKpRD9/gxtJy7kiVD01J
	 MPgvTcrVYmw1hKU+F5hrycbMDg13QPVO7KnxGUrI4u97slPGhZ18xqI6wqY2LCq8Vtas4
	 iAa7qmwciUbfORUo2xKWzq+USQI4KXoCBeVEOdg5zn7sxTLYgnoeh0hosAq9bPeBdwzZo
	 /3EMiIkWea4lrvaooZru+HqomFxJbgw9U96jJO7aXFzqyMWp8e2wQHfG8R0JC3ap8Qw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SnF1ntF4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFCF606A31D
	for <linux-kbuild@vger.kernel.org>; Mon, 26 Oct 2026 22:48:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FFCF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SnF1ntF4
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-676858d42f8so3138409d50.2
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Oct 2026 15:48:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793054919; cv=none;
        d=google.com; s=arc-20260327;
        b=WSex2H9QcjO+s4HGURqs462u5vAVZ0htiuycvWNk4V4XhYvZk4Bs+cMNrwfGIghBax
         5t1JKP3FlfzmAShV3IB3Fjo1r6fUGpLmkH8mFyVyujZmn78JIoVcMGrynvePaZwO7UOI
         c1JhzfC/+f66qcYiVaNodo67CWjwXzZZe8UcgGAs2TYuKvF0mmFiBBDo8mJk71Fwh23r
         c5+SwaRjoN1lxVUoQqaZNZU34FPexH+df7oUvbOjuhpvEXLmYV0tIFfUR1o0PGef/YAs
         R39M6z6sOxKm3nvCDTCJCnNQCu1s/CkTiZA/VYWGG9GKySiluYICYps8qaR8O7Xmup2/
         JiUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mshdBP7zWJ8tsttLUx6xhnibBdLHVDUK/dBlFucrT6E=;
        fh=ty7SxZUrtaMpKkZFEt06AYgbKCFfqpbLqC/ToX4/JzY=;
        b=AegSydFPZ7o0SM3xlq65Ic3ng2p4jL4if3pZdKXqoYL3pFEAKztTiaGsA8Zpobie++
         tA3VuyaqN8H7PedseK9GCfD6SL+IkecP8l92cmb7lY1oIRUNTBbeAvitEuPqMjIGMccy
         NzSdL2W8km9wKoih95NFQ0lG9vsT10tZrucJ/JncvhUnlgiT/HtI4N2gWYLBT89W9n/w
         tz8XKlTQwzclkJjvYyu0JuGP2eyfvRUhF3elo0xCrkrrPdx4GaSGOyGTEhl1wEfbXo0o
         /89g2KomANXa9fmMy8Ft8d/U3WBkue98IhMdgEymQfVEgyD7sXjxASP8vWDCa3WZNW2y
         jYtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793054919; x=1793659719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mshdBP7zWJ8tsttLUx6xhnibBdLHVDUK/dBlFucrT6E=;
        b=SnF1ntF4XuLhwTNO4r8C2ofkbyMGGoR5PdXfNN9t9VWO3yFs/8r66gFcF1pdNQXepR
         kIJl0rsP1RI/QJNEhD6E+yBQMtCr8/NiDPP0/sPqOAEJQbcigh4QoPTtV1j4hmNIBMZE
         JtpnOGRAz9wHIHTLgqLBwyeXq15P6A00Oo8kMOjhQ3iK2kBHSKD0rNGzA7wm0vXSVzrc
         VADoUaE+fbMk8xm6WZNerxuTP4l2ZJEkEZgdKL2QZQ3lB/wB5ZxnsdYIu+6tsnhCmNzY
         iO0tVHNvUNJ3n2VwO2fW8ASjzII7w2kI4NwdAg4aTjTWsotY75oYDRofd6KgyLtNuQU7
         Y+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793054919; x=1793659719;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mshdBP7zWJ8tsttLUx6xhnibBdLHVDUK/dBlFucrT6E=;
        b=H0q0MWEBU07ivD02PFoilusmxxzG0Er4mFyFR+ma5Hloc63iy5m0KOXxVka5Y4wMrZ
         MoXcxkpBJuY6vlprcGWaJDWGPrM/GFyJ46XDPB3kWhPByatVgSAa/jTT0+ayBWI7macj
         cut5lmiaugNBzqWaiJmN94ZTSOiJvPesO9iyHEcoVC+56FAVXhhaQoLG2Ckgvlp0r0NX
         dHZKOuPza6Mp8bzVtFS7Xe2MTqL4e/IwAvwt5v4xjz37RFssGutrAQLZFAnrk3VHab4J
         lnxWSID/XiKsL6o/eReYkuHmu5/l25V0K1BUz0VZUag+CMxvp2xaDYEuoZ2KaDqSX+Na
         i5mg==
X-Forwarded-Encrypted: i=1; AKwUvBylZG+gEcfsfxjtlLAu0hncbuedOibbiSAyAl6CeTy1lb11MJwdhKMVeGxJDBDvSldXHBTYOfBnGZ/sLak=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdGJ/WT1MNNkFBfq9r9MoVDHU+4qq3CuzmYQ/Nxm3MBbQzcX1B
	hzBJI1UP+mbomyhZQOr9pbk9VZL4Gb1LzhbkGVCLsgWmo2/tiQ7Uyvr24mX00j0cqg+EdED52cf
	Z6lgjZc2En1ULuj1dP6C0CpCsyQbU9/I=
X-Gm-Gg: AYBFou0cNv2UrH2S0hCOtcSr5yejg9s+GcphwQw0daYVvKtw7ZulUUZGU/GPJjvqhrz
	6mFFrGuu/hiySEcOVAb9MIf2bwSKvCZeCCDrwmAO6qsa8RCqd8l/4hEQ1V0RIkof2WDZWfkY5SG
	OsiOEYJWXtWjzHNgy3jcAzsotIG+GMjQpszL9gaEtd1i7SsVN3vntLdfasLYg8RJJg8LciR0OAY
	xKEQgp2+LwambUKP5dZx+xJuxm5baAS+RYHwVm1vBuLiIpDu+FCAbXBMLz7E27HEUCTawOiFuSW
	eJm29Zmyd03CNQIqxnMV1ctV7GzUl9+NJL1OXqfaBWuetGQU6Afte/J4VPrl6IqXTZm6nTVGkhb
	E6Zo8IjoJwSS8BRZbwtADgro9SzFWz85Nvor5LfBKEOOtzHhT+p9oGBOWtaZLcJ/WTrbfG1O2Wf
	fVWDmXrPB1KRJLzWs=
X-Received: by 2002:a53:ad85:0:b0:672:ef39:5fc6 with SMTP id
 956f58d0204a3-67a454900ffmr2904378d50.147.1793054919173; Mon, 26 Oct 2026
 15:48:39 -0700 (PDT)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012-dd-cmap-part2-clean-v12-0-3c8cc5725def@gmail.com>
 <20261012-dd-cmap-part2-clean-v12-26-3c8cc5725def@gmail.com> <sashiko-outbox-170725@kernel.org>
In-Reply-To: <sashiko-outbox-170725@kernel.org>
From: jim.cromie@gmail.com
Date: Mon, 26 Oct 2026 16:48:13 -0600
X-Gm-Features: AclHuK_U9GeBl7u0-5vmIpwTNJsdz2Sn-v3e-HGd_0bRIhFESQNIVxLVo-t00Ow
Message-ID: <CAJfuBxxZ=znaXKhz6w3tT-qq-AKPQHWwzWr53w98k2wDAh3Ytw@mail.gmail.com>
Subject: Re: [PATCH v12 26/40] dyndbg-test: add do_bulk testpoint, rename
 do_prints to do_classes
To: sashiko-reviews@lists.linux.dev
Cc: Jason Baron <jbaron@akamai.com>, Shuah Khan <shuah@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Jonathan Corbet <corbet@net.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	John Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 8:37=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Low] test_dynamic_debug: classmap offset mismatch for submodule classe=
s
> - [Low] locking: param_set_do_repeats blocks param_lock for up to 60s
> --
>
> commit adf504f365302c7db4e37850cebef69f82ed353f
> Author: Jim Cromie <jim.cromie@gmail.com>
>
> dyndbg-test: add do_bulk testpoint, rename do_prints to do_classes
>
> This patch renames do_prints to do_classes to better align with its purpo=
se
> and introduces do_bulk to generate high-volume workloads. It adds support=
 for
> executing these debug operations multiple times or over a timed duration =
using
> shared module parameter callbacks.
>
> > diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
> > index 01ce07001d4c7..19e27b5747ac2 100644
> > --- a/lib/test_dynamic_debug.c
> > +++ b/lib/test_dynamic_debug.c
>
> [ ... ]
>
> > @@ -28,25 +28,57 @@
> >  #endif
> >
> >  #include <linux/module.h>
> > +#include <linux/sched.h>
> > +#include <linux/sched/signal.h>
> > +#include <linux/jiffies.h>
> >
> > -/* re-gen output by reading or writing sysfs node: do_prints */
> > +#define TEST_MAX_REPEATS 10000
> > +#define TEST_MAX_SECONDS 60
> >
> > -static void do_prints(void); /* device under test */
> > -static int param_set_do_prints(const char *instr, const struct kernel_=
param *kp)
> > +/* re-trigger debug output by reading or writing sysfs nodes: do_class=
es or do_bulk */
> > +static void do_classes(int); /* device under test */
> > +static void do_bulk(int);    /* device under test */
> > +
> > +static int param_set_do_repeats(const char *instr, const struct kernel=
_param *kp)
> >  {
> > -     do_prints();
> > +     int rc, ct;
> > +     void (*repeat_fn)(int) =3D kp->arg;
> > +
> > +     rc =3D kstrtoint(instr, 0, &ct);
> > +     if (rc) {
> > +             pr_err("expecting numeric input, using 1 instead\n");
> > +             ct =3D 1;
> > +     }
> > +     if (ct > TEST_MAX_REPEATS) {
> > +             pr_warn("%s: clamping %d to %d\n", kp->name, ct, TEST_MAX=
_REPEATS);
> > +             ct =3D TEST_MAX_REPEATS;
> > +     } else if (ct < -TEST_MAX_SECONDS) {
> > +             pr_warn("%s: clamping %d seconds to -%d\n",
> > +                     kp->name, ct, TEST_MAX_SECONDS);
> > +             ct =3D -TEST_MAX_SECONDS;
> > +     }
> > +
> > +     repeat_fn(ct);
>
> [Severity: Low]
> Does this synchronous loop execution block param_lock system-wide?
>
> When test_dynamic_debug is built-in, writing to its module parameters via
> sysfs triggers param_attr_store() in kernel/params.c, which acquires the
> global param_lock mutex around the .set callback:
>
> kernel/params.c:param_attr_store() {
>     ...
>     kernel_param_lock(mk->mod);
>     if (param_check_unsafe(attribute->param))
>         err =3D attribute->param->ops->set(buf, attribute->param);
>     ...
> }
>
> Because param_set_do_repeats() invokes the workload synchronously (which
> can run for up to 60 seconds as shown in do_classes() below), this starve=
s
> param_lock, preventing other processes from reading or writing any
> built-in module parameters for the duration.


    In standard usage, test_dynamic_debug is built as a module
(CONFIG_TEST_DYNAMIC_DEBUG=3Dm).
    Under kernel/params.c:KPARAM_MUTEX(mod), modular parameters
acquire the module's
    private &(mod)->param_lock rather than the global param_lock. The
lock-hold is
    strictly local to test_dynamic_debug's own sysfs nodes and has
zero impact on
    core kernel or other module parameters.

    Even in the hypothetical built-in case
(CONFIG_TEST_DYNAMIC_DEBUG=3Dy in a test
    kernel, which I would consider mis-configured),
    test_dynamic_debug is exclusively a test harness whose workloads are
    triggered on demand by explicit sysfs writes. The loops call
cond_resched() and
    check signal_pending(current) on every iteration, keeping the execution
    cooperative and immediately abortable via SIGINT.




>
> > +
> >       return 0;
> >  }
>
> [ ... ]
>
> > @@ -103,7 +135,10 @@ enum cat_disjoint_bits {
> >       D2_DRMRES };
> >
> >  /* numeric verbosity, V2 > V1 related.  V1 is > D2_DRMRES */
> > -enum cat_level_num { V1 =3D 16, V2, V3, V4, V5, V6, V7 };
> > +enum cat_level_num { V1 =3D 16, V2, V3, V4, V5, V6, V7, V8 };
> > +
> > +/* test _USE_ w offset */
> > +enum cat_level_offset { Vu1 =3D V1 + 8, Vu2, Vu3, Vu4, Vu5, Vu6, Vu7, =
Vu8 };
> >
> >  /* recapitulate DRM's multi-classmap setup */
> >  #if !defined(TEST_DYNAMIC_DEBUG_SUBMOD)
>
> [ ... ]
>
> > @@ -160,6 +183,19 @@ DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_emptyclass, 0, =
0 /* ,empty */);
> >  DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_maptype, 3, 10, "no such type");
> >  DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_base_len, 0, 60,
> >                             "base", "plus", "classes", "length", "too-b=
ig");
> > +#endif
> > +
> > +#else /* TEST_DYNAMIC_DEBUG_SUBMOD */
> > +
> > +/*
> > + * in submod/drm-drivers, use the classmaps defined in top/parent
> > + * module above.
> > + */
> > +
> > +DYNAMIC_DEBUG_CLASSMAP_USE(map_disjoint_bits);
> > +DYNAMIC_DEBUG_CLASSMAP_USE_(map_level_num, 7);
>
> [Severity: Low]
> Is this registration macro passing an outdated offset?
>

yes - fixed in v13 (forthcoming)

> The patch adds V8 to map_level_num, increasing its length to 8. While
> cat_level_offset correctly shifts the submodule's class definitions by 8
> (Vu1 =3D V1 + 8) above, this registration macro still tells dyndbg the
> classes start at offset 7.
>
> This mismatch causes submodule debug callsites to map to the wrong class
> IDs, leaving the last class (Vu8) completely out of bounds and
> uncontrollable.
>
> > +
> > +#if defined(DD_MACRO_ARGCHECK)
> >  DYNAMIC_DEBUG_CLASSMAP_USE_(fail_offset_big, 100);
> >  #endif /* DD_MACRO_ARGCHECK */
>
> [ ... ]
>
> > @@ -210,20 +247,85 @@ static void do_levels(void)
>
> [ ... ]
>
> > -static void do_prints(void)
> > +static void do_classes(int ct)
> > +{
> > +     if (ct < 0) {
> > +             unsigned long timeout =3D jiffies + (-ct) * HZ;
> > +
> > +             pr_debug("%s for %d seconds:\n", __func__, -ct);
> > +             while (time_before(jiffies, timeout)) {
> > +                     if (signal_pending(current))
> > +                             break;
> > +                     do_cats();
> > +                     do_levels();
> > +                     cond_resched();
> > +             }
> > +             return;
> > +     }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-dd-cmap-=
part2-clean-v12-0-3c8cc5725def@gmail.com?part=3D26
