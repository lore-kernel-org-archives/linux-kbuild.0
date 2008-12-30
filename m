Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ti-out-0910.google.com ([209.85.142.189]:48009 "EHLO
	ti-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751179AbYL3GR2 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 30 Dec 2008 01:17:28 -0500
Received: by ti-out-0910.google.com with SMTP id b6so7953480tic.23
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Dec 2008 22:17:26 -0800 (PST)
Message-ID: <df9815e70812292217p65b6285eo7a7909c0f6899e6e@mail.gmail.com>
Date: Tue, 30 Dec 2008 14:17:26 +0800
From: "Jike Song" <albcamus@gmail.com>
Subject: Do we really need file `all'?
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org

Hi Sam,

 In commit a680eedc6c621c75695c68198533fc3c98f4053b you introduced the
following code:

        exuberant()
        {
                all_sources > all
                all_sources | xargs ....{snip}...

This will generate a regular file named `all' in the repository, which
is not included in .gitignore.
Do we really need this file? I think the second run of all_source is
enough.  Or otherwise should
we add it into .gitignore?

I'm not subscribing linux-kbuild list so please CC me in replies, thanks.

-- 
Thanks,
Jike
