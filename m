Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from fieldses.org ([174.143.236.118]:53693 "EHLO fieldses.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S965461AbaFQWiz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 17 Jun 2014 18:38:55 -0400
Date: Tue, 17 Jun 2014 18:38:54 -0400
Subject: relative objtree change broke tar builds?
Message-ID: <20140617223854.GC6168@fieldses.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
From: "J. Bruce Fields" <bfields@fieldses.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

The scripts I use for my kernel testing rely on the targz-pkg make
target.  After updating to 3.16-rc1 my scripts started failing.  In
scripts/package/buildtar:

  tmpdir="${objtree}/tar-install"
  tarball="${objtree}/linux-${KERNELRELEASE}-${ARCH}.tar"
..
  #
  # Create the tarball
  #
  (
        cd "${tmpdir}"
        opts=
        if tar --owner=root --group=root --help >/dev/null 2>&1; then
                opts="--owner=root --group=root"
        fi
        tar cf - boot/* lib/* $opts | ${compress} > "${tarball}${file_ext}"
  )


After 7e1c04779efd511 "kbuild: Use relative path for $(objtree)", that's a
relative instead of absolute path so the tarball's dumped by default into
tmpdir, not what was intended.

The changelog there says

	The main Makefile sets its working directory to the object tree
	and never changes it again. Therefore, we can use '.' instead of
	the absolute path.

But the main Makefile also exports objtree, and a quick grep suggests
lots of other uses outside the main Makefile.

--b.
