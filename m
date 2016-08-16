Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:35950 "EHLO
	mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752329AbcHPVKd (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 16 Aug 2016 17:10:33 -0400
Received: by mail-io0-f193.google.com with SMTP id y34so8432051ioi.3
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Aug 2016 14:10:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1471354514-12323-1-git-send-email-dmonakhov@openvz.org>
References: <1471354514-12323-1-git-send-email-dmonakhov@openvz.org>
From: Jim Davis <jim.epost@gmail.com>
Date: Tue, 16 Aug 2016 14:10:31 -0700
Message-ID: <CA+r1ZhgdtRUO3r1neBjgWJeC6D=6gK=Fos1icakYr9wV7yi+gw@mail.gmail.com>
Subject: Re: [PATCH 1/2] scripts: buildtar fix build w/o modules
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dmitry Monakhov <dmonakhov@openvz.org>
Cc: linux-kbuild@vger.kernel.org

On Tue, Aug 16, 2016 at 6:35 AM, Dmitry Monakhov <dmonakhov@openvz.org> wrote:
> If build configured w/o modules script fails because lib/ is not exit.

"does not exist"?

When I ran into this once before, it did seem the tar archive was
fine.  But it was disconcerting to see an error message, followed by
buildtar claiming that the tarball was successfully created...


> +       tar cf - -C "$tmpdir" . $opts | ${compress} > "${tarball}${file_ext}"

If, somehow, there are files in $tmpdir that aren't in /boot (or /lib)
then this would put things in the tar archive that weren't there
before the patch.  I don't offhand see how that could happen, but a
more conservative approach would be to test for /lib.

-- 
Jim
