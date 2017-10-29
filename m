Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:22324 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751587AbdJ2UXM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 29 Oct 2017 16:23:12 -0400
Date: Mon, 30 Oct 2017 04:22:17 +0800
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH] Check all .c files for bad kernel-doc comments
Message-ID: <201710300443.YSMfb5Mo%fengguang.wu@intel.com>
References: <20171027194149.14328-1-willy@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline
In-Reply-To: <20171027194149.14328-1-willy@infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: kbuild-all@01.org, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, Matthew Wilcox <mawilcox@microsoft.com>


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Matthew,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v4.14-rc6 next-20171018]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Matthew-Wilcox/Check-all-c-files-for-bad-kernel-doc-comments/20171030-033926
config: i386-tinyconfig (attached as .config)
compiler: gcc-6 (Debian 6.2.0-3) 6.2.0 20160901
reproduce:
        # save the attached .config to linux build tree
        make ARCH=i386 

All warnings (new ones prefixed by >>):

>> fs//attr.c:114: warning: Excess function parameter 'Returns' description in 'inode_newsize_ok'
>> fs//attr.c:205: warning: No description found for parameter 'attr'
>> fs//attr.c:205: warning: Excess function parameter 'iattr' description in 'notify_change'
--
>> arch/x86/kernel/i8259.c:234: warning: No description found for parameter 'trigger'
--
>> arch/x86/kernel/tsc.c:1163: warning: No description found for parameter 'work'
--
>> arch/x86/mm/pgtable.c:558: warning: No description found for parameter 'reserve'
>> arch/x86/mm/pgtable.c:595: warning: No description found for parameter 'p4d'
>> arch/x86/mm/pgtable.c:595: warning: No description found for parameter 'addr'
>> arch/x86/mm/pgtable.c:595: warning: No description found for parameter 'prot'
   arch/x86/mm/pgtable.c:605: warning: No description found for parameter 'p4d'
>> arch/x86/mm/pgtable.c:629: warning: No description found for parameter 'pud'
   arch/x86/mm/pgtable.c:629: warning: No description found for parameter 'addr'
   arch/x86/mm/pgtable.c:629: warning: No description found for parameter 'prot'
>> arch/x86/mm/pgtable.c:654: warning: No description found for parameter 'pmd'
   arch/x86/mm/pgtable.c:654: warning: No description found for parameter 'addr'
   arch/x86/mm/pgtable.c:654: warning: No description found for parameter 'prot'
   arch/x86/mm/pgtable.c:680: warning: No description found for parameter 'pud'
   arch/x86/mm/pgtable.c:695: warning: No description found for parameter 'pmd'
--
>> arch/x86/events/intel/pt.c:1064: warning: No description found for parameter 'nr_pages'
>> arch/x86/events/intel/pt.c:1064: warning: Excess function parameter 'size' description in 'pt_buffer_init_topa'
--
>> drivers/base/attribute_container.c:255: warning: No description found for parameter 'fn'
>> drivers/base/attribute_container.c:369: warning: No description found for parameter 'cont'
>> drivers/base/attribute_container.c:369: warning: No description found for parameter 'dev'
>> drivers/base/attribute_container.c:369: warning: No description found for parameter 'classdev'
--
>> kernel//events/core.c:133: warning: No description found for parameter 'cpu'
>> kernel//events/core.c:9911: warning: No description found for parameter 'flags'
>> kernel//events/core.c:10350: warning: No description found for parameter 'overflow_handler'
>> kernel//events/core.c:10350: warning: No description found for parameter 'context'
--
>> kernel//events/hw_breakpoint.c:420: warning: No description found for parameter 'context'
>> kernel//events/hw_breakpoint.c:434: warning: Excess function parameter 'triggered' description in 'modify_user_hw_breakpoint'
>> kernel//events/hw_breakpoint.c:434: warning: Excess function parameter 'tsk' description in 'modify_user_hw_breakpoint'
   kernel//events/hw_breakpoint.c:502: warning: No description found for parameter 'context'
--
>> kernel//irq/devres.c:103: warning: Excess function parameter 'thread_fn' description in 'devm_request_any_context_irq'
--
>> kernel//power/qos.c:476: warning: No description found for parameter 'new_value'
>> kernel//power/qos.c:476: warning: Excess function parameter 'value' description in 'pm_qos_update_request'
--
>> kernel//time/timekeeping.c:370: warning: No description found for parameter 'tkf'
   kernel//time/timekeeping.c:419: warning: No description found for parameter 'tkf'
>> kernel//time/timekeeping.c:568: warning: No description found for parameter 'nb'
   kernel//time/timekeeping.c:587: warning: No description found for parameter 'nb'
>> kernel//time/timekeeping.c:680: warning: No description found for parameter 'tk'
>> kernel//time/timekeeping.c:1268: warning: No description found for parameter 'ts'
>> kernel//time/timekeeping.c:1268: warning: Excess function parameter 'tv' description in 'timekeeping_inject_offset'
   kernel//time/timekeeping.c:1313: warning: No description found for parameter 'tk'
>> kernel//time/timekeeping.c:1313: warning: No description found for parameter 'tai_offset'
>> kernel//time/timekeeping.c:1324: warning: No description found for parameter 'data'
   kernel//time/timekeeping.c:1449: warning: No description found for parameter 'ts'
   kernel//time/timekeeping.c:1472: warning: No description found for parameter 'ts'
   kernel//time/timekeeping.c:1545: warning: No description found for parameter 'tk'
   kernel//time/timekeeping.c:1963: warning: No description found for parameter 'tk'
   kernel//time/timekeeping.c:2004: warning: No description found for parameter 'tk'
>> kernel//time/timekeeping.c:2004: warning: No description found for parameter 'offset'
>> kernel//time/timekeeping.c:2004: warning: No description found for parameter 'shift'
>> kernel//time/timekeeping.c:2004: warning: No description found for parameter 'clock_set'
>> kernel//time/timekeeping.c:2254: warning: No description found for parameter 'txc'
>> kernel//time/timekeeping.c:2307: warning: No description found for parameter 'phase_ts'
>> kernel//time/timekeeping.c:2307: warning: No description found for parameter 'raw_ts'
..

vim +114 fs//attr.c

^1da177e4 Linus Torvalds    2005-04-16   97  
25d9e2d15 npiggin@suse.de   2009-08-21   98  /**
25d9e2d15 npiggin@suse.de   2009-08-21   99   * inode_newsize_ok - may this inode be truncated to a given size
25d9e2d15 npiggin@suse.de   2009-08-21  100   * @inode:	the inode to be truncated
25d9e2d15 npiggin@suse.de   2009-08-21  101   * @offset:	the new size to assign to the inode
25d9e2d15 npiggin@suse.de   2009-08-21  102   * @Returns:	0 on success, -ve errno on failure
25d9e2d15 npiggin@suse.de   2009-08-21  103   *
7bb46a673 npiggin@suse.de   2010-05-27  104   * inode_newsize_ok must be called with i_mutex held.
7bb46a673 npiggin@suse.de   2010-05-27  105   *
25d9e2d15 npiggin@suse.de   2009-08-21  106   * inode_newsize_ok will check filesystem limits and ulimits to check that the
25d9e2d15 npiggin@suse.de   2009-08-21  107   * new inode size is within limits. inode_newsize_ok will also send SIGXFSZ
25d9e2d15 npiggin@suse.de   2009-08-21  108   * when necessary. Caller must not proceed with inode size change if failure is
25d9e2d15 npiggin@suse.de   2009-08-21  109   * returned. @inode must be a file (not directory), with appropriate
25d9e2d15 npiggin@suse.de   2009-08-21  110   * permissions to allow truncate (inode_newsize_ok does NOT check these
25d9e2d15 npiggin@suse.de   2009-08-21  111   * conditions).
25d9e2d15 npiggin@suse.de   2009-08-21  112   */
25d9e2d15 npiggin@suse.de   2009-08-21  113  int inode_newsize_ok(const struct inode *inode, loff_t offset)
25d9e2d15 npiggin@suse.de   2009-08-21 @114  {
25d9e2d15 npiggin@suse.de   2009-08-21  115  	if (inode->i_size < offset) {
25d9e2d15 npiggin@suse.de   2009-08-21  116  		unsigned long limit;
25d9e2d15 npiggin@suse.de   2009-08-21  117  
d554ed895 Jiri Slaby        2010-03-05  118  		limit = rlimit(RLIMIT_FSIZE);
25d9e2d15 npiggin@suse.de   2009-08-21  119  		if (limit != RLIM_INFINITY && offset > limit)
25d9e2d15 npiggin@suse.de   2009-08-21  120  			goto out_sig;
25d9e2d15 npiggin@suse.de   2009-08-21  121  		if (offset > inode->i_sb->s_maxbytes)
25d9e2d15 npiggin@suse.de   2009-08-21  122  			goto out_big;
25d9e2d15 npiggin@suse.de   2009-08-21  123  	} else {
25d9e2d15 npiggin@suse.de   2009-08-21  124  		/*
25d9e2d15 npiggin@suse.de   2009-08-21  125  		 * truncation of in-use swapfiles is disallowed - it would
25d9e2d15 npiggin@suse.de   2009-08-21  126  		 * cause subsequent swapout to scribble on the now-freed
25d9e2d15 npiggin@suse.de   2009-08-21  127  		 * blocks.
25d9e2d15 npiggin@suse.de   2009-08-21  128  		 */
25d9e2d15 npiggin@suse.de   2009-08-21  129  		if (IS_SWAPFILE(inode))
25d9e2d15 npiggin@suse.de   2009-08-21  130  			return -ETXTBSY;
25d9e2d15 npiggin@suse.de   2009-08-21  131  	}
25d9e2d15 npiggin@suse.de   2009-08-21  132  
25d9e2d15 npiggin@suse.de   2009-08-21  133  	return 0;
25d9e2d15 npiggin@suse.de   2009-08-21  134  out_sig:
25d9e2d15 npiggin@suse.de   2009-08-21  135  	send_sig(SIGXFSZ, current, 0);
25d9e2d15 npiggin@suse.de   2009-08-21  136  out_big:
25d9e2d15 npiggin@suse.de   2009-08-21  137  	return -EFBIG;
25d9e2d15 npiggin@suse.de   2009-08-21  138  }
25d9e2d15 npiggin@suse.de   2009-08-21  139  EXPORT_SYMBOL(inode_newsize_ok);
25d9e2d15 npiggin@suse.de   2009-08-21  140  
7bb46a673 npiggin@suse.de   2010-05-27  141  /**
6a1a90ad1 Christoph Hellwig 2010-06-04  142   * setattr_copy - copy simple metadata updates into the generic inode
7bb46a673 npiggin@suse.de   2010-05-27  143   * @inode:	the inode to be updated
7bb46a673 npiggin@suse.de   2010-05-27  144   * @attr:	the new attributes
7bb46a673 npiggin@suse.de   2010-05-27  145   *
6a1a90ad1 Christoph Hellwig 2010-06-04  146   * setattr_copy must be called with i_mutex held.
7bb46a673 npiggin@suse.de   2010-05-27  147   *
6a1a90ad1 Christoph Hellwig 2010-06-04  148   * setattr_copy updates the inode's metadata with that specified
25985edce Lucas De Marchi   2011-03-30  149   * in attr. Noticeably missing is inode size update, which is more complex
2c27c65ed Christoph Hellwig 2010-06-04  150   * as it requires pagecache updates.
7bb46a673 npiggin@suse.de   2010-05-27  151   *
7bb46a673 npiggin@suse.de   2010-05-27  152   * The inode is not marked as dirty after this operation. The rationale is
7bb46a673 npiggin@suse.de   2010-05-27  153   * that for "simple" filesystems, the struct inode is the inode storage.
7bb46a673 npiggin@suse.de   2010-05-27  154   * The caller is free to mark the inode dirty afterwards if needed.
7bb46a673 npiggin@suse.de   2010-05-27  155   */
6a1a90ad1 Christoph Hellwig 2010-06-04  156  void setattr_copy(struct inode *inode, const struct iattr *attr)
^1da177e4 Linus Torvalds    2005-04-16  157  {
^1da177e4 Linus Torvalds    2005-04-16  158  	unsigned int ia_valid = attr->ia_valid;
4a30131e7 NeilBrown         2006-01-08  159  
^1da177e4 Linus Torvalds    2005-04-16  160  	if (ia_valid & ATTR_UID)
^1da177e4 Linus Torvalds    2005-04-16  161  		inode->i_uid = attr->ia_uid;
^1da177e4 Linus Torvalds    2005-04-16  162  	if (ia_valid & ATTR_GID)
^1da177e4 Linus Torvalds    2005-04-16  163  		inode->i_gid = attr->ia_gid;
^1da177e4 Linus Torvalds    2005-04-16  164  	if (ia_valid & ATTR_ATIME)
^1da177e4 Linus Torvalds    2005-04-16  165  		inode->i_atime = timespec_trunc(attr->ia_atime,
^1da177e4 Linus Torvalds    2005-04-16  166  						inode->i_sb->s_time_gran);
^1da177e4 Linus Torvalds    2005-04-16  167  	if (ia_valid & ATTR_MTIME)
^1da177e4 Linus Torvalds    2005-04-16  168  		inode->i_mtime = timespec_trunc(attr->ia_mtime,
^1da177e4 Linus Torvalds    2005-04-16  169  						inode->i_sb->s_time_gran);
^1da177e4 Linus Torvalds    2005-04-16  170  	if (ia_valid & ATTR_CTIME)
^1da177e4 Linus Torvalds    2005-04-16  171  		inode->i_ctime = timespec_trunc(attr->ia_ctime,
^1da177e4 Linus Torvalds    2005-04-16  172  						inode->i_sb->s_time_gran);
^1da177e4 Linus Torvalds    2005-04-16  173  	if (ia_valid & ATTR_MODE) {
^1da177e4 Linus Torvalds    2005-04-16  174  		umode_t mode = attr->ia_mode;
^1da177e4 Linus Torvalds    2005-04-16  175  
7fa294c89 Eric W. Biederman 2012-09-02  176  		if (!in_group_p(inode->i_gid) &&
23adbe12e Andy Lutomirski   2014-06-10  177  		    !capable_wrt_inode_uidgid(inode, CAP_FSETID))
^1da177e4 Linus Torvalds    2005-04-16  178  			mode &= ~S_ISGID;
^1da177e4 Linus Torvalds    2005-04-16  179  		inode->i_mode = mode;
^1da177e4 Linus Torvalds    2005-04-16  180  	}
7bb46a673 npiggin@suse.de   2010-05-27  181  }
6a1a90ad1 Christoph Hellwig 2010-06-04  182  EXPORT_SYMBOL(setattr_copy);
7bb46a673 npiggin@suse.de   2010-05-27  183  
27ac0ffea J. Bruce Fields   2011-09-20  184  /**
27ac0ffea J. Bruce Fields   2011-09-20  185   * notify_change - modify attributes of a filesytem object
27ac0ffea J. Bruce Fields   2011-09-20  186   * @dentry:	object affected
27ac0ffea J. Bruce Fields   2011-09-20  187   * @iattr:	new attributes
27ac0ffea J. Bruce Fields   2011-09-20  188   * @delegated_inode: returns inode, if the inode is delegated
27ac0ffea J. Bruce Fields   2011-09-20  189   *
27ac0ffea J. Bruce Fields   2011-09-20  190   * The caller must hold the i_mutex on the affected object.
27ac0ffea J. Bruce Fields   2011-09-20  191   *
27ac0ffea J. Bruce Fields   2011-09-20  192   * If notify_change discovers a delegation in need of breaking,
27ac0ffea J. Bruce Fields   2011-09-20  193   * it will return -EWOULDBLOCK and return a reference to the inode in
27ac0ffea J. Bruce Fields   2011-09-20  194   * delegated_inode.  The caller should then break the delegation and
27ac0ffea J. Bruce Fields   2011-09-20  195   * retry.  Because breaking a delegation may take a long time, the
27ac0ffea J. Bruce Fields   2011-09-20  196   * caller should drop the i_mutex before doing so.
27ac0ffea J. Bruce Fields   2011-09-20  197   *
27ac0ffea J. Bruce Fields   2011-09-20  198   * Alternatively, a caller may pass NULL for delegated_inode.  This may
27ac0ffea J. Bruce Fields   2011-09-20  199   * be appropriate for callers that expect the underlying filesystem not
27ac0ffea J. Bruce Fields   2011-09-20  200   * to be NFS exported.  Also, passing NULL is fine for callers holding
27ac0ffea J. Bruce Fields   2011-09-20  201   * the file open for write, as there can be no conflicting delegation in
27ac0ffea J. Bruce Fields   2011-09-20  202   * that case.
27ac0ffea J. Bruce Fields   2011-09-20  203   */
27ac0ffea J. Bruce Fields   2011-09-20  204  int notify_change(struct dentry * dentry, struct iattr * attr, struct inode **delegated_inode)
^1da177e4 Linus Torvalds    2005-04-16 @205  {

:::::: The code at line 114 was first introduced by commit
:::::: 25d9e2d15286281ec834b829a4aaf8969011f1cd truncate: new helpers

:::::: TO: npiggin@suse.de <npiggin@suse.de>
:::::: CC: al <al@dizzy.pdmi.ras.ru>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--wRRV7LY7NUeQGEoC
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--wRRV7LY7NUeQGEoC--
