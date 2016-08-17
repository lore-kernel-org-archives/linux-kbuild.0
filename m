Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:33901 "EHLO
	mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753334AbcHQWeX (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 17 Aug 2016 18:34:23 -0400
Received: by mail-io0-f196.google.com with SMTP id i199so818411ioi.1
        for <linux-kbuild@vger.kernel.org>; Wed, 17 Aug 2016 15:34:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1471383577-18173-1-git-send-email-dmonakhov@openvz.org>
References: <1471383577-18173-1-git-send-email-dmonakhov@openvz.org>
From: Jim Davis <jim.epost@gmail.com>
Date: Wed, 17 Aug 2016 15:19:04 -0700
Message-ID: <CA+r1ZhgewOjmCFpjnZw6LgC6ea2UY0rxW0Js6oiAENioYPV_pQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] scripts: buildtar fix build w/o modules v2
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dmitry Monakhov <dmonakhov@openvz.org>
Cc: linux-kbuild@vger.kernel.org

On Tue, Aug 16, 2016 at 2:39 PM, Dmitry Monakhov <dmonakhov@openvz.org> wrote:
> If build configured w/o modules script fails because lib/ is not exit.

Tested-by: Jim Davis <jim.epost@gmail.com>

(But tweaking "is not exit" in the commit message would still be a good idea.)

-- 
Jim
