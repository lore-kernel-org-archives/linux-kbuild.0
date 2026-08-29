Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1CE340282
	for <linux-kbuild@vger.kernel.org>; Sat, 29 Aug 2026 10:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788001057; cv=pass; b=GR3dPaBvaLboTG8qb9gvepBHN4DQRnkh68EpXxOrSF9hytK7nOnm9XjrBED7uNx0WBSo3xwQe6W6IN98vuMCW3T/Zk4KgNrYcrJ5ITZTteV6SUGERkIc17KxSmLxib7ek15UY+zVX3HBbfAcZnccuEaUmpmkFBSY194VLgkHETE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788001057; c=relaxed/simple;
	bh=hsBKohLfCZd0jfnALC1cEzA++W2MrcDhahlgqPLVM7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VmJ0qU20IDcrvW6qZpI3WdCxy+xyc1FoD4Z+6NOUWO88PKINuLgw/4ZJ1tV9/cgO/hInc6weCGtnJJXDauhqc3PyCJJB1or78Qhi2Cqm0nsorfwg1Ew2DrmPRhRRaFB8h5jXRzhcs7iA0nZNmFVEAI+XHfrDt+Jl9eiOatUeb6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qxB9/ucO; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qxB9/ucO"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d5862bc921so4444255ad.1
        for <linux-kbuild@vger.kernel.org>; Sat, 29 Aug 2026 03:57:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788001056; cv=none;
        d=google.com; s=arc-20260327;
        b=cPewEblMmi6j+Vw0+EGP8lf/tn2Onoz1T09nuLfzCi5y4pkF9KfKbtv7bNcpZYQ+5C
         t/x+jmWZOmMApwJbCC4WVuNMh2AoFnp1vBWLUJL9RhK/R1nVDTU2RbznyGajax3FsVAR
         mb9KS5UDbQ/PYKazHfyvk5EDiTm4zOIF+Bcee8c8nk6Z8g+XCZZAvaagjWLBREPBC+U8
         72KSvyOWM4mQNiilAjCbKoD2EDw9UPP7eUtLJQXoy8IpvCdrfY6LzsesK9HcSUSWoA3o
         o69MwTeEBPBD+//1eMg2FFJfolVLa8J5gojtbMPOy6xKMi3cewaGNJ6shJuAFPxqCGz0
         iIWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3yoXZjSinVl6bLZjtfCsRoIy2CcONJCPzcPUWytAk2w=;
        fh=2i5a3meXOuM1eSEHWpg5rvRM9BEptXSLc+B7uf7xkCI=;
        b=mH6LZ5nfSGu1//O9lWtWS9Rs1FQl88Hyejx6F1S79AD9YVXKg8Ku8N4/62YNpobWrd
         CSmk8K51tSg9sgXX/9CourpRIlUwhQjoaP2y8ijkrggmaHkpXh64xjfObZHUI7YuXtb6
         0iSy6f14Z5ZRau+PXNRB+MUVW80SCMymJm2LveU7bwqgLl/IwGnZJPuHNX564rLi/iz/
         riD7yy/ItROc+rlZyYYBI7OiClTRvr3Ttk4lVgRTTzKeY1uAEblo0ABfw+6MZ5VTPiod
         cgcj+f38m5mm2bkz8tV32ze9PfrZOFZOA/D7acSFOJiutdDsOel4wD3rSJKVYRdsNPR1
         j6Ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788001056; x=1788605856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3yoXZjSinVl6bLZjtfCsRoIy2CcONJCPzcPUWytAk2w=;
        b=qxB9/ucOSNJYhkRxeEyJuIaaChnbkIeziSSD+2tZkrRhLbLNtPwwaw4AnOsFMkGHgH
         g8av33wNg8aFOi0uNrjq+Yypt2oDfrdfygCqbkDmAzG5fuTS1GaoG3u/rzSOQp64bZcr
         Wr8t+It1pfy/S1oP/PjrrW6Lt8BGDP9OyfNZoC6PKX9aTpe0hvxrhZVOb2JooagrMlPz
         TUMkgAqwJXV3g83TJ0bJH6Fnm2rHWOxxW7ClpQ3zjd3BOyBL4NDx9juMBCRdInYkLope
         g97Vy96kHGCKy87vUJsdUFVo8/sZJhGJwdy6K//5s348jFOgAAUIsevfCJRcwtlGtwCE
         +tfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788001056; x=1788605856;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3yoXZjSinVl6bLZjtfCsRoIy2CcONJCPzcPUWytAk2w=;
        b=FgwXorn8axx6Ie+sYlFWX8LKCw3lkStdFo/AIAea24payI+4zQsjnUbtUky2jc6ha/
         2FM6/ZYHTgZTKDoLcX6CGYTj0Gyhr7q3d0FTNqXcCQxht0Jlmwag1Z9KrYe3iTMaKPJW
         01mrgAS3OJGkPE0jEKH4YwlBx+p7HMu2D6r0AjF80wp11b3v1S12HQ1L2LsqD74WWxA4
         nVy/mTIWmAp6K40B9Arm7nBDmRhI6pl+mziWz79q7aArTXtFKbcTK3e+kUZ5Opme/Qmd
         ri+5JM1TEVsJgsVDiWYhl+5gQ9M//lEn33HIP+L8rTsGJFISGHejYhU0vJsI2gYMLqd9
         ZtpA==
X-Forwarded-Encrypted: i=1; AKwUvByVJePHaF6kZmUUO4cBc6UbS1z4fPrkPjr8co5hU50iZyf7goGG8TcEDSiEWSulHP6sNl4zzL/nPN1sKPw=@vger.kernel.org
X-Gm-Message-State: AFuF++l3gOn2q3PREV4oi/dEKvUGVJQ/MnY8PB/5/mIs5ow4iyQAcrQq
	1+qVIf/2opY6GoYPmsf490UEQdiBMsoIQL+ElKCbgPzmuAB7gW1qCxTXlZ147d0fGA4OQtYptjM
	35CXS7jEKJFm6hlAklBwnnl32o2EzNxk=
X-Gm-Gg: AR+sD10PnzAgR+glQsPZkWLnmg6gMgPwRan62+NkDakrlI19eI1V07fj1wsHMWfXl9e
	xA0QwtkRwG80yL/b5OoVlZO/ECYph9GANv7iI64AG/IFlWao5r/jsvuifhIuT6MtcgbrRWi6de6
	3wxpsbhyDBcATVzdE2iNaLhoniYay4OsMF0FxFbeTYJE8/zcZtycZAc0lmf20U0dHO7m4Yc0+uv
	HWq/4pSlx536glr0L0kYcXOIoxjKaLy+2wanrvz+43mcdn/Fa4AtYr8LweHsd70CkTeJk38ozTz
	2Xoq33hj1z/6x08qwNd1SVANaV/LNxNAvwxRxPUy9FwJ5keEoRmDQ9WE1wLoN73yFwUM/KukUcV
	TNh9K7aqu7fucvTQb8XkvVNE6Y9UZ/4u2muiz67J3o/J1qVTkRQ/RC/NrWrnc
X-Received: by 2002:a17:903:1104:b0:2c9:8287:fd0d with SMTP id
 d9443c01a7336-2d74df62ccemr115727945ad.3.1788001055774; Sat, 29 Aug 2026
 03:57:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7d8ba914cd174d716340bb2b88723bef0f330627.1787565460.git.gtucker@gtucker.io>
 <apG3hwaPA8f7SJeI@levanger> <b45e7864-928c-4b3c-aa62-64f4f63d85c7@gtucker.io>
 <CANiq72k6T9Y_Vubih6pFMQBxju2xQq0VQkCXT1WL0qSyCXKxyA@mail.gmail.com> <9a3eabd1-4057-45cf-99b9-9c3c1b6260d3@gtucker.io>
In-Reply-To: <9a3eabd1-4057-45cf-99b9-9c3c1b6260d3@gtucker.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 29 Aug 2026 12:57:22 +0200
X-Gm-Features: AcwNN1U4Xd-ZPEH0J5NkeG85FCsQEWIBZhyX8xsSVfYp0sl8uMCqeYTmtDyhT2w
Message-ID: <CANiq72m0eemCPbEAvZSC49OZHyaNvQgbMdSDphT01no1B+YWEA@mail.gmail.com>
Subject: Re: [PATCH 1/2] scripts: add TOML config to container tool
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Nathan Chancellor <nathan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, linux-doc@vger.kernel.org, 
	workflows@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, automated-testing@lists.yoctoproject.org, 
	"kernelci lists.linux.dev" <kernelci@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 29, 2026 at 11:02=E2=80=AFAM Guillaume Tucker <gtucker@gtucker.=
io> wrote:
>
> See "bc20c56e98e0 docs: changes: better document Python needs"
>
> Also it's explained briefly in the docs here:
>
>    https://www.kernel.org/doc/html/latest/process/changes.html#python
>
> So I guess that if it's needed for at least one build configuration,
> then it's not optional anymore.

Yeah, that is the commit I was referring to, but I am not sure what
that commit meant, i.e. if that were the case, then e.g. Rust would be
mandatory too since it is required for at least one build
configuration... :)

I guess the commit was trying to say "used in enough places" or
perhaps "the default config of at least one architecture" or "some
`make` targets" or a combination of all those, but it is not clear.

Cheers,
Miguel
