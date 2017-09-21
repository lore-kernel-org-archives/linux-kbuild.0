Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35789 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751738AbdIUXmD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Sep 2017 19:42:03 -0400
Received: by mail-wm0-f65.google.com with SMTP id e64so6485653wmi.2
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Sep 2017 16:42:02 -0700 (PDT)
Date: Fri, 22 Sep 2017 01:41:54 +0200
From: Nicolas Porcel <nicolasporcel06@gmail.com>
Subject: Re: [PATCH 2/2] kconfig: support out of tree KCONFIG_CONFIG
Message-ID: <20170921234154.GA21682@nicolas-laptop>
References: <20170818222052.22375-1-nicolasporcel06@gmail.com>
 <20170818222052.22375-3-nicolasporcel06@gmail.com>
 <CAK7LNAQWFKFcm2PbOc-wc2bP1YmKBObhyyWr51mw6MCZRzVGOQ@mail.gmail.com>
 <20170902222101.GA5414@nicolas-netbook>
 <CAK7LNASmS0tNXvo=p_j_yKgNnmgGP7PpejB-aJWpUL05MrKRgg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNASmS0tNXvo=p_j_yKgNnmgGP7PpejB-aJWpUL05MrKRgg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Wed, Sep 20, 2017 at 06:56:17PM +0900, Masahiro Yamada wrote:
> Some targets can choose the save path of the .config file.
> 
> For example, run "make gconfig"
> then choose "File  ->  Save as"
> from the menu.
>
> But, silentoldconfig does not have a way to save .config
> out out the build tree.

Yes, I noticed this feature when writing the patch and I tried not to
break it. However, running make without target will call silentconfig
before building and it is not possible to use a file outside the build
folder.

The reason I did this patch is because I am keeping my kernel
configuration files in an external git repository and I am using
KCONFIG_CONFIG to select the reference this config. It was working well
before 4.13. But maybe my workflow is wrong.

> 
> conf_write() may be called with a directory path,
> in this case, the KCONFIG_OVERWRITECONFIG is appended
> as the base name.
> 
> If we support an absolute path in KCONFIG_OVERWRITECONFIG,
> I think it is strange.
> 

According to the documentation, KCONFIG_OVERWRITECONFIG is a boolean
that should be set if the .config file is a symlink. In the code, it
conf_write will directly write the config file unstead of creating a
temporary file and renaming it to .config.

So it allows me to use any file on the machine by symlinking it to the
.config file of the build folder so that I can keep my current workflow.
Unfortunately, I didn't know about it before writing the patch.

The strange part is that KCONFIG_CONFIG supports absolute path in most
of the build process. It only breaks when referencing a file on a
different file-system than the build folder, and only because of the
silentconfig call.

Best regards,

-- 
Nicolas Porcel
