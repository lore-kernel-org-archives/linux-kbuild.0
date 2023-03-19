Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D393FC6FD1F
	for <linux-kbuild@archiver.kernel.org>; Sun, 19 Mar 2023 07:03:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbjCSHDI (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sun, 19 Mar 2023 03:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbjCSHDH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 19 Mar 2023 03:03:07 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAC502729;
        Sun, 19 Mar 2023 00:03:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 09CA2B80A37;
        Sun, 19 Mar 2023 07:03:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 029D0C433D2;
        Sun, 19 Mar 2023 07:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679209382;
        bh=/a6U6UtFlxip0Uz1h4W9dHu2mVmUZYemNEJcJqUCAiY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kEMSHHXI8eSXHdTba10+FSnF7DsxLUith1YBgTx1GOHWxtWdtRPTgHIElHuwH7p77
         Y6ld0fz0JokSam7FcqYkwV1efKazDz/aDe9qI/nmhjF38F1knbH7uD3O3IZZmFeui3
         IkgErDOSXB/rigl7MadazmqsQ0h8xYfUJwmCuAX+WNw1m7/hKpmsHhvvMhmujTrK+y
         rLHP+BulBn/eiJK5zBCyNSsZ8Hy33zBp4oSY3T7M6Ynrof+q6dSgL/qt30pBZ7vndi
         IS9MMQkGt5Jd34xRgqewOkLNKY5ScewLOsDsaxu0thKDe43Bd+iBj6ycdsEO5lWOdO
         MXvHYTt1B2QKw==
Date:   Sun, 19 Mar 2023 09:02:57 +0200
From:   Leon Romanovsky <leon@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nick Terrell <terrelln@fb.com>,
        Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH 0/6] kbuild: fix some packaging issues, and use
 git-archive for source package
Message-ID: <20230319070257.GA798212@unreal>
References: <20230312200731.599706-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230312200731.599706-1-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Mar 13, 2023 at 05:07:25AM +0900, Masahiro Yamada wrote:
> This series fixes some bugs, then switch to 'git archive'
> for source package creation as suggested by Linus.
>=20
>=20
>=20
> Masahiro Yamada (6):
>   kbuild: deb-pkg: make debian source package working again
>   kbuild: deb-pkg: do not take KERNELRELEASE from the source version
>   kbuild: deb-pkg: set CROSS_COMPILE only when undefined
>   kbuild: deb-pkg: split image and debug objects staging out into
>     functions
>   kbuild: deb-pkg: use dh_listpackages to know enabled packages
>   kbuild: use git-archive for source package creation
>=20

Thanks,
Tested-by: Leon Romanovsky <leonro@nvidia.com>
