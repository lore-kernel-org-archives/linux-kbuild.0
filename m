Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F4623A564
	for <linux-kbuild@vger.kernel.org>; Thu, 15 Oct 2026 15:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078415; cv=pass; b=BGYmxYrOjOiG3r2moP7IU2RLl/OjcaxMBLK0TcP4vbzIz/83QYTF07gqVnwx3KAM32tMDAuRDcriqHiyB57UpV7bPM30yvaqk5xzrYKXCkTkmsMaKRBoXMgcJ18XU8+XxnGiMcA3oE5eltiT/NJjZNHrpzE+mUNCGCNRXZ+gdHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078415; c=relaxed/simple;
	bh=EwFBEjpzx+AogMUYstrZjzWsEBgz1yLeWchGZwFuIWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EyIYs5AL2ZH336Bb/B7A7Pg/PilH9kBWskSRM59qiej/fN/AziJQtAx37uBXNUYDho44SsM55QCdnuSnKg3Yl8Asi+6Py8NYMq6y/CTTZaf9QRLnBMowJyveKRbt8YEVbvErbgTjPQBfyqpdG1ZMf0EoxJvB3alljZdeDXfqrs4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HSK65X0L; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HSK65X0L"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48df8fe8513so563499f8f.0
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Oct 2026 08:33:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792078404; cv=none;
        d=google.com; s=arc-20260327;
        b=BaOsVImSx1asbQj2Zdlq7VIs8oXf/cNWTvpKaxq/hm9tNq2UTaCACj7NUXAnbTrhsg
         wV7ZWHSn0sgu9TpOjYkHdD+SS6ZGpER9zFVqvhsk187m2p+TzwijA3pFo9uNgowvFolX
         cpTWZ+4GXpdZVRGjYya8pKEqudggzIxIYGd2+IWKCkiEYvgw4/lHCn4zUCgRktNItntT
         uaOu84rmPqDDYZmNDrRZ2C637v34rbq0MF6ux0R74ZA1TL4TLFmvQUA3LlR2XBN4hfjm
         jBIUeTtjnLtHnzeumMC/yjCusmnySKbwNMWdWaTIZR/VvDRsGwusQrM3FG50WzHtzqTT
         y4hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RnXdeLR8uLxWAp/EGqtkD57zfy4KroVSjFqtijIOcj4=;
        fh=seAIrfX6x+b7qCfWVleewDvhtK/Ge9MXU/GM2+CrfSw=;
        b=d6vrlwe8dWrMgfrgjVP0JSYBTTro/JEhmSwPIQYwXY1qeWxfzcD1BzTxOqDxSlcN0X
         ZFl2cMLN8zqK4Q9ZElcAmQDU+xYZlfu1eqQqrLHhjB9jJdskSJ4fzCdTtutxFpWqqthT
         d5vWsoKAsj0Z05M7GFdCFPZJuVxKm9TpFBEX/T5bdgS0o8A3fNzREotuJha7MIPxRoBF
         TTEJeG2UGTsXLxbeE7TpXvMtPi3APwbhKzDT32732UaHVQKTs7UCbJlMxgku6xZ4nQp/
         oirEd9bCchG7+CjObxzNJdQF/jqRI2wEs84T+pgj83BhEC0NAB77qkVV9rxif0wT0Saf
         ka7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792078404; x=1792683204; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RnXdeLR8uLxWAp/EGqtkD57zfy4KroVSjFqtijIOcj4=;
        b=HSK65X0LNqT0Ci4EaY+eB94FWP835oDQI1qBeaSJhuvNeb7VLUKY9UQh5eIEKkJ5pQ
         /e3cbfen3KmKK/cvG2fkQDR1axxCskdahJnk8dAPkTXoNX7bk/iVyr9WT5wtja7BiKIV
         GQBbgCZ5WLIGQTUWTnjhL+rysI+lihafiypvlcab/UQfOSZbRxIYL3k9bsr3z+SJ81B5
         pFGhIt4YcsMGC7wx8CaNNkOtNj9xlXib/5qZDuQMf9K2Ax8dbS9xiFUwkK4xiqSvGeQz
         o8k3GUlINUoYh8XENQ2WTE5l2EimA4TsTvAx5R3GCVGUp/8YkqSRHIdxOVeRBbM0FBkB
         DrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792078404; x=1792683204;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RnXdeLR8uLxWAp/EGqtkD57zfy4KroVSjFqtijIOcj4=;
        b=x5oU3r7bNXSi0d/oMJ8NTl2q+qjjJytYvE151P+3Yj8fcFOyCrL/L1X1I0qg2lQX29
         y3HfewZWeivvyYnzqfZYnCPKVX8Kyxp8tsoJg2K+PTv4HbhDn09lCzu4VJNkLp988Pv/
         qjJZC0GumwUYGXpTTKKLHdOPbL1r6UZ7gUfaMhf3Hk/wB30dZMFBZMe/cYMHDB1EWxrK
         I87jAwy6CLV3KRyspQpprtXMC1RhmWo3DZvMKUA5N+LoBpQpoLiDzsLILh0u7KFtneYF
         OykRNQZroeJ85cPsILFmXeGTD2I0KbTNNsWBbl+18QmnybQ/MVC87GFdFe8AcZ5NWiFR
         ZRYA==
X-Forwarded-Encrypted: i=1; AKwUvBwnITeBBOu+lrNSHAe7U5f6sW3TcnQgXGZMxLsrbb9uld9dusjkkOwRzT9oj7lbh4bIBU+QZqHXC0QLdz0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJx7m5vkyXaNf1UIfNH1TNWwCdLJ0e4HMS3nB9y/PCDAcbv/ZOQ
	f1fcUw2kNaWfDtG7mUc6A29HMIogtJV2gDLvJguEQb5wJLKB5J0fQpvKf06TvpJqDtSeEeifZ/m
	vdy9To5jddY38dzkSTWO20kPPmK1yBfZBO0f5zEne
X-Gm-Gg: AYBFou2UL9HsfQrpqvagts4Lv7jfBFGeQLl9DOuBcaJa5xSXj3xCeFvbCiNqEGZlxJG
	rxUlttIf4XO1wkGR3xLMYDrjfm+YJ7TsPU5ryLpKSMKkcyeITRUQEaM3E3sIegkbESmDDUwcGct
	kOi+SHzhraWaVzb0eV7J3SOEF/StrE/jJDHVwWOc2jjII+zTXEzCt7cmo2I9BCtpOxsSKiDbLwm
	HlhQJ/YVT5uJdwFhA8AH++oeiLoC/rUL3mauPvGmTl8qf5D/aB1eE8guNlCtSlLyAHtTWj8RAQc
	ORzCyePm7+9UCvv4LxkBGRy3047upZCNG1ap7BSYdxrVvsH3NHFtXQ6f/vwOw5uQnDmuU6R71Kl
	uW5uhpZd9Ts9WbKXNItE7zD0DjUHGG8GNeaCZsyNDPm7qPo5KdCV/Sum9+dqeiUXCRyX/5YgUdy
	yQTQwliJ+q/yGcM9kuxCTm5HueDmSXs21a+uia7bXBNJR54MswVpgZ
X-Received: by 2002:a5d:5d0e:0:b0:48b:1147:3d75 with SMTP id
 ffacd0b85a97d-48dbace44ebmr35131681f8f.45.1792078403051; Thu, 15 Oct 2026
 08:33:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015135752.17028-1-vngocvan@gmail.com>
In-Reply-To: <20261015135752.17028-1-vngocvan@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 15 Oct 2026 08:33:11 -0700
X-Gm-Features: AclHuK9_V3VROI7C5QHxcUZo9gsmpWA-9dqcNZ_FnjWuoNsZd9_ENKv7AbFgjHQ
Message-ID: <CAKwvOdnkS7AnuJkQr=5-TO6eRL+joSNUKGfqK-mbim9_y0NW=A@mail.gmail.com>
Subject: Re: [PATCH] gen_compile_commands: honor the build directory for modules
To: vngocvan <vngocvan@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, morbo@google.com, 
	justinstitt@google.com, masahiroy@kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 6:58=E2=80=AFAM vngocvan <vngocvan@gmail.com> wrote=
:
>
> When invoked from outside the build tree with -d and a modules.order
> argument, the script opens .mod files relative to the current directory
> instead of the specified build directory. This can fail with
> FileNotFoundError or collect commands from unrelated artifacts in the
> current directory.
>
> Pass the build directory to cmdfiles_for_modorder() and resolve both
> the .mod files and their associated .cmd files relative to it. Absolute
> paths continue to work, and the output location is unchanged.
>
> Fixes: ecca4fea1ede ("gen_compile_commands: support *.o, *.a, modules.ord=
er in positional argument")
> Signed-off-by: vngocvan <vngocvan@gmail.com>
> ---
>  scripts/clang-tools/gen_compile_commands.py | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-=
tools/gen_compile_commands.py
> index 8d14b81efd73..149135f85f19 100755
> --- a/scripts/clang-tools/gen_compile_commands.py
> +++ b/scripts/clang-tools/gen_compile_commands.py
> @@ -124,7 +124,7 @@ def cmdfiles_for_a(archive, ar):
>          yield to_cmdfile(obj)
>
>
> -def cmdfiles_for_modorder(modorder):
> +def cmdfiles_for_modorder(modorder, root_directory):
>      """Generate the iterator of .cmd files associated with the modules.o=
rder.
>
>      Parse the given modules.order, and yield every .cmd file used to bui=
ld the
> @@ -132,6 +132,7 @@ def cmdfiles_for_modorder(modorder):
>
>      Args:
>          modorder: The modules.order file to parse
> +        root_directory: The directory where the objects were built
>
>      Yields:
>          The path to every .cmd file found
> @@ -142,11 +143,11 @@ def cmdfiles_for_modorder(modorder):
>              base, ext =3D os.path.splitext(obj)
>              if ext !=3D '.o':
>                  sys.exit('{}: module path must end with .o'.format(obj))
> -            mod =3D base + '.mod'
> +            mod =3D os.path.join(root_directory, base + '.mod')
>              # Read from *.mod, to get a list of objects that compose the=
 module.
>              with open(mod) as m:
>                  for mod_line in m:
> -                    yield to_cmdfile(mod_line.rstrip())
> +                    yield os.path.join(root_directory, to_cmdfile(mod_li=
ne.rstrip()))

Thanks for the patch. Can we avoid os.path in favor of Path from
Pathlib? Here and throughout.

>
>
>  def process_line(root_directory, command_prefix, file_path):
> @@ -206,7 +207,7 @@ def main():
>          elif path.endswith('.a'):
>              cmdfiles =3D cmdfiles_for_a(path, ar)
>          elif path.endswith('modules.order'):
> -            cmdfiles =3D cmdfiles_for_modorder(path)
> +            cmdfiles =3D cmdfiles_for_modorder(path, directory)
>          else:
>              sys.exit('{}: unknown file type'.format(path))
>
>
> base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
> --
> 2.56.0
>


--=20
Thanks,
~Nick Desaulniers
