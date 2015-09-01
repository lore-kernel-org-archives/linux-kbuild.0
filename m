Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f51.google.com ([209.85.213.51]:34758 "EHLO
	mail-vk0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752714AbbIAObT (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 1 Sep 2015 10:31:19 -0400
Received: by vkhf67 with SMTP id f67so57945169vkh.1
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Sep 2015 07:31:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1441115335-25165-1-git-send-email-riku.voipio@linaro.org>
References: <1441115335-25165-1-git-send-email-riku.voipio@linaro.org>
Date: Tue, 1 Sep 2015 07:31:18 -0700
Message-ID: <CA+r1ZhgpBNwHqivqiyV7b-39GSOtpyzDhCkeSqPV8LpZ3aasTQ@mail.gmail.com>
Subject: Re: [PATCH] package/Makefile: move source tar creation to a function
From: Jim Davis <jim.epost@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: riku.voipio@linaro.org
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>

On Tue, Sep 1, 2015 at 6:48 AM,  <riku.voipio@linaro.org> wrote:
> From: Riku Voipio <riku.voipio@linaro.org>
>
> Split source tarball creation from rpm-pkg target
> so it can be used from deb-pkg target as well. Other
> improvements:
>
> - Replace symlink to self with tar --transform

While probably everyone -- or almost everyone -- uses gnu tar, that
particular option isn't available in older versions of gnu tar
(https://groups.google.com/forum/#!topic/uk.comp.os.linux/-7LDdMSRo5w).
Perhaps something could be added to Documentation/Changes about the
gnu tar version required?

-- 
Jim
