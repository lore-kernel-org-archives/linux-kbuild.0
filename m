Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717CF43E098
	for <linux-kbuild@vger.kernel.org>; Thu, 16 Jul 2026 17:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784223276; cv=pass; b=uoBnIk5CdDB2uJwMlWWzmOzJ8Q3mWYizr8w6DUpmBIRARNE8jv5NU0SkY3rbLCyf/Iih3D+fK3VCaHh5YEW+4keHb98+wQZe19D4LS1JNaltGOyBIPfj1MMs/rk3tUwRiBoGuzL/G92LcjeaOnfMnXGDjqOH2+H4cw24vgSwTFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784223276; c=relaxed/simple;
	bh=Bf0pr4WmpzKbUE5FTFbXjHJgAExHpUniP7+wGXdOcqQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Lu73nEZAnD1/j/e0OXQAhughfHj29cTS5NCNKHWJJIVfwgQ0B5C+WND4Bz2rouGquzjjBhwL10v95B571dGf+CUfzSq4sJjET24IztozbzFXRcM/1r3ZuWcSOKvT+GW0BucehSLc+4TY5e5/Yi7gNDtCk5yJYTmE2Q/qARFHMTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dcXqkOCs; arc=pass smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dcXqkOCs"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-385ea3ce80dso6884397a91.2
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Jul 2026 10:34:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784223275; cv=none;
        d=google.com; s=arc-20260327;
        b=TPYZ6cjZVbe40roirhm/FvPDfMqaoQrIFnn932GzoWGKjUgype4NJBTF5YLFjFdkIr
         d2E295Gq18LYME6PMmjSlifOfUETJPkYGZLibI9jylBUsoYoxpfLHK9JJLpO6CliXRK5
         C0pueyHL50K0NQZTB7eAQMfpL00oCRL1LdnIsEcojAxesfLPRAZl8vte3y7NssqAeHa4
         2jjaDhNr2jmfM+5rWJ1DX7CBM32VfJd18IoAwmFpQa/16SwcRYczVubBC1t0n/FX+ycU
         j7pgN5OUUJdReyZgY2nw43rVn6+esfUyqJcb0WxFMsdY7qoYUTJIj0DpVFcFJXg0WOwp
         ndwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Bf0pr4WmpzKbUE5FTFbXjHJgAExHpUniP7+wGXdOcqQ=;
        fh=AysKwrq9tyzODJsHI2LdkFQdk5M8cjLD5D4+ApUd5lo=;
        b=AqgiC/LUOkkjtEzc7t9Pr80b7w1HPcPrjsT0Wwfn4dA8n2+Ey/C3tWF2U0YH2CiJFn
         dIWDIlnXahsbBuGrMX5+VzyZ86C2SfcfOjYP3FZysidF/U2nuuVVbspFuz6bMMP9bghR
         uROofsfeXTlEA783OXEL/VFMsFhO9SXwSFM1NbfRnW3stnILEbGP3vurmXmWTLT0+1lb
         sDtZ2Jhw6GJItz5Gq4Zv1upe09LooiZedM7THomicr6NSAIWFu+2WQy47UCDZUkaz1ky
         HJ40VlFvGsz+UHWw2M3V6Z64MaJpJ+yBPQymFXFOFDF6Xw3PzPHkLWfwDmVvuXYovxiN
         4Rgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784223275; x=1784828075; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Bf0pr4WmpzKbUE5FTFbXjHJgAExHpUniP7+wGXdOcqQ=;
        b=dcXqkOCsPupgU8onP1Wze7jaawWp+JlkD3GNNIWX+HJCF/VQU3vCl7kFkgSBP2+WpC
         CW5g95IbDwTadGqOdmBlm33A0NSc6hWvtEwgjz7oUie22Y3SHXunV+y3H/YLkmilgiDf
         zn19aSmMNjuNpoSNjzPkdyc2ODIzl2LqIkZvKyP+nTO5hoSyb6P8YrH/HzpwwP5N7sFr
         djfBZQSVYLv9pOMkG4orPhB8KS9xeAalTa1JDWelmC38JJ2gAIP/C7r+I+uD05SD8i/+
         pWO1pwYQVHaN863DC1mLSV3u1NIOxWss75mditZcQUEceN2w/f9No9pyaF/413XoB75h
         gpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784223275; x=1784828075;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bf0pr4WmpzKbUE5FTFbXjHJgAExHpUniP7+wGXdOcqQ=;
        b=Eu0WiklZHjRwgihP/HxCEefmrNgvmgG1uS/bto27AVj3f/zbA83MlcESTSbv63+yIT
         JSCJG/Tyfrmj/JnWurbvJE8bYDtlFO5ls2kB79520zWZLH8KhPF2YnlHDoyqEzHNSwZe
         8/MGqKNzeJ0GpVgZXUFJtai/Fo7181wOGXmzzt6zGTKYNWadxjtehY6HhXqCdMTdf2i6
         H9ZsKrLK+6mK/ORwn6qEpUiuVbIoPR24G3Lge2RLMWGS56vz6/bVUBAQpAbhiudD8LM0
         6kDCSbPB1XLwlW2/rRbuSgUVJLSZB8GrjsdFi90ANqqnw2x9PdfNxK9gk1P+9RBHn71K
         mnCA==
X-Gm-Message-State: AOJu0YzwCsjgqlzijTmlN8l1r1+KDZE8Ti5LKnxaTG7ZME8gCkU4/Ziz
	YJ/ku2q+p6HsH1B8oAWA4Y9r9CAQpYcQBavM+WQQL51gYZyE5wLbL6Imf+jzuyzjQRN1lHknG+a
	Dq7FGmPA64PFvVISVFIMSmebbhJpSk2VuJyZr
X-Gm-Gg: AfdE7ckHtxMElHFXznKACspeTisDIjGdtmPeI+SknzTPVKuZPmaA2qllkNgxqtdooNU
	kNRfC2laIfreOJhKT++FgBIejMUamT3iZccgkCAd82/4WflxPIsPmSwI1hiPQVKC4ZMc6b1xyN0
	Ds+v9zmMDOZDYrJbIMCDf4uW8gFqjJpbxcoOTMfsuslAsXwGZ1QsDfdFShqs9enkkkmeTn2EH9v
	IEwg0OLzPsCLiv/Mtqd0riKSCDEOVUxl5VOIlFlC6RKF4NhELADOimGxkGwsBRQDLS+khTSvXCI
	xQsg2I7t09gkO5dDEB8=
X-Received: by 2002:a17:90b:2248:b0:38e:2d37:843d with SMTP id
 98e67ed59e1d1-38e2d37852amr6154156a91.32.1784223274756; Thu, 16 Jul 2026
 10:34:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Anish Rashinkar <rashinkar.anish@gmail.com>
Date: Thu, 16 Jul 2026 23:04:23 +0530
X-Gm-Features: AUfX_mzwxp-LhbEzLXr8NU85gctRc-1Yxm8FBKLXeF9xyHxYwfhw1xaVecJP91c
Message-ID: <CAOESE2Q2-0KUDaM0mUo+c_F-tMaUsBZ-gpnhdoe0rmYdgnnuJQ@mail.gmail.com>
Subject: MO flag not working properly for building out-of-tree modules, tries
 to replace the Makefile in the kernel's source.
To: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I have a few projects in which I am writing kernel modules. I use the
MO flag to put the build artifacts in a separate directory. A simple
make command with MO would look like -
make -C /lib/modules/$(uname -r)/build M=$PWD MO=$PWD/build/ modules

This used to work for me, and still works for me if I boot into the
6.19.10-300 kernel that Fedora preserved. I was on 7.0.X for a while
on Arch Linux and it worked there too. I am not sure but I might have
tried compiling my projects (if so, compiled successfully) on Fedora
Atomic that I was trying out, which should have been on 7.0 or 7.1. As
of the latest kernels on both Arch Linux and Fedora (7.1.3-201 on
Fedora), I encounter an error when using the MO flag.

make -C /lib/modules/7.1.3-201.fc44.x86_64/build M=/home/anish/temp
MO=/home/anish/temp/build modules
make[1]: Entering directory '/usr/src/kernels/7.1.3-201.fc44.x86_64'
make[2]: Entering directory '/home/anish/temp/build'
/bin/sh: line 1: /usr/src/kernels/7.1.3-201.fc44.x86_64/.tmp_Makefile:
Permission denied
make[3]: *** [/usr/src/kernels/7.1.3-201.fc44.x86_64/Makefile:705:
/usr/src/kernels/7.1.3-201.fc44.x86_64/Makefile] Error 1
make[2]: *** [/usr/src/kernels/7.1.3-201.fc44.x86_64/Makefile:248:
__sub-make] Error 2
make[2]: Leaving directory '/home/anish/temp/build'
make[1]: *** [Makefile:248: __sub-make] Error 2
make[1]: Leaving directory '/usr/src/kernels/7.1.3-201.fc44.x86_64'
make: *** [Makefile:6: all] Error 2

If I grant root privileges to make, it will replace the Makefile at
/usr/src/kernels/7.1.3-201.fc44.x86_64/Makefile with its own Makefile
wrapper.

If I don't use the MO flag, then the build succeeds and all the build
artifacts are stored in my source directory.

I am new to Linux programming and especially bug reporting like this.
I had raised this issue on Fedora Discussions with no one to properly
respond that helps the problem. This issue should have appeared
relatively recently. Please let me know if this is a bug or something
changed with how it should be used, because the official guides state
the same way I mentioned in writing a Makefile and using the MO flag.
And with what I can comprehend and with what all LLMs are saying, this
is a bug.
